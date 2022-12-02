#!/bin/bash -e

# vim: tabstop=4 shiftwidth=4 softtabstop=4
# -*- sh-basic-offset: 4 -*-

WEB_UPGRADE=false
BRANCH_VERSION=
MANAGE_NETWORK=
UPGRADE_SYSTEM=

if [ -f .env ]; then
    source .env
fi

while getopts ":w:b:n:s:" arg; do
    case "${arg}" in
        w)
            WEB_UPGRADE=true
        ;;
        b)
            BRANCH_VERSION=${OPTARG}
        ;;
        n)
            MANAGE_NETWORK=${OPTARG}
        ;;
        s)
            UPGRADE_SYSTEM=${OPTARG}
        ;;
    esac
done

if [ "$WEB_UPGRADE" = false ]; then

  # Make sure the command is launched interactive.
  if ! [ -t 0  ]; then
    echo -e "Detected old installation command. Please use:\n$ bash <(curl -sL https://raw.githubusercontent.com/ealmonte32/ealmonte32.github.io/main/resources/install.sh)"
    exit 1
  fi

  # clear screen
  clear;

  # Set color of logo
  tput setaf 6
  tput bold

  cat << EOF
       _____                           __         ____  _____ ______
      / ___/_____________  ___  ____  / /_  __   / __ \/ ___// ____/
      \__ \/ ___/ ___/ _ \/ _ \/ __ \/ / / / /  / / / /\__ \/ __/
     ___/ / /__/ /  /  __/  __/ / / / / /_/ /  / /_/ /___/ / /___
    /____/\___/_/   \___/\___/_/ /_/_/\__, /   \____//____/_____/
                                     /____/
EOF

  # Reset color
  tput sgr 0
  
  echo -e "Screenly OSE requires a dedicated Raspberry Pi / SD card.\nYou will not be able to use the regular desktop environment once installed.\n"
  read -p "Do you still want to continue with ealmonte32 github Patch-1 branch? (y/N)" -n 1 -r -s INSTALL
  if [ "$INSTALL" != 'y' ]; then
    echo
    exit 1
  fi

# Remove these once the above code has been restored.
export DOCKER_TAG="latest"
#export BRANCH="master"
export BRANCH="patch-1"

  echo && read -p "Do you want Screenly OSE to manage your network? This is recommended for most users because this adds features to manage your network. (Y/n)" -n 1 -r -s NETWORK && echo

  echo && read -p "Would you like to perform a full system upgrade as well? (y/N)" -n 1 -r -s UPGRADE && echo
  if [ "$UPGRADE" != 'y' ]; then
      EXTRA_ARGS=("--skip-tags" "system-upgrade")
  fi

elif [ "$WEB_UPGRADE" = true ]; then
  if [ -z "${BRANCH}" ]; then
    if [ "$BRANCH_VERSION" = "latest" ]; then
      export DOCKER_TAG="latest"
      BRANCH="patch-1"
    elif [ "$BRANCH_VERSION" = "production" ]; then
      export DOCKER_TAG="production"
      BRANCH="production"
    else
      echo -e "Invalid -b parameter."
      exit 1
    fi
  fi
  if [ "$MANAGE_NETWORK" = false ]; then
    NETWORK="n"
  elif [ "$MANAGE_NETWORK" = true ]; then
    NETWORK="y"
  else
    echo -e "Invalid -n parameter."
    exit 1
  fi
  if [ "$UPGRADE_SYSTEM" = false ]; then
      EXTRA_ARGS=("--skip-tags" "system-upgrade")
  else
    echo -e "Invalid -s parameter."
    exit 1
  fi
else
  echo -e "Invalid -w parameter."
  exit 1
fi

if [ -z "${REPOSITORY}" ]; then
  if [ "$WEB_UPGRADE" = false ]; then
    set -x
    REPOSITORY=${1:-https://github.com/ealmonte32/screenly-ose.git}
  else
    set -e
    REPOSITORY=https://github.com/ealmonte32/screenly-ose.git
  fi
fi

if [ ! -f /home/${USER}/screenly ]; then
    mkdir /home/${USER}/screenly
fi

sudo mkdir -p /etc/ansible
echo -e "[local]\nlocalhost ansible_connection=local" | sudo tee /etc/ansible/hosts > /dev/null

if [ ! -f /etc/locale.gen ]; then
    # No locales found. Creating locales with default US setup.
    echo -e "en_US.UTF-8 UTF-8" | sudo tee /etc/locale.gen > /dev/null
    sudo locale-gen
fi

sudo sed -i 's/apt.screenlyapp.com/archive.raspbian.org/g' /etc/apt/sources.list
sudo apt update -y
sudo apt-get install -y --no-install-recommends \
    git \
    libffi-dev \
    libssl-dev \
    python3 \
    python3-dev \
    python3-pip \
    whois

if [ "$NETWORK" == 'y' ]; then
  export MANAGE_NETWORK=true
  sudo apt-get install -y network-manager
else
  export MANAGE_NETWORK=false
fi

# Install Ansible from requirements file.
if [ "$BRANCH" = "patch-1" ]; then
    ANSIBLE_VERSION=$(curl -s https://raw.githubusercontent.com/Screenly/screenly-ose/master/requirements/requirements.host.txt | grep ansible)
else
    ANSIBLE_VERSION=ansible==2.8.8
fi

sudo pip install cryptography==38.0.2
sudo pip install "$ANSIBLE_VERSION"
sudo -u ${USER} ansible localhost \
    -m git \
    -a "repo=$REPOSITORY dest=/home/${USER}/screenly version=$BRANCH force=no"
cd /home/${USER}/screenly/ansible

sudo -E -u ${USER} ansible-playbook site.yml "${EXTRA_ARGS[@]}"

sudo apt-get autoclean
sudo apt-get clean
sudo docker system prune -f
sudo apt autoremove -y
sudo apt-get install plymouth --reinstall -y
sudo find /usr/share/doc \
    -depth \
    -type f \
    ! -name copyright \
    -delete
sudo find /usr/share/doc \
    -empty \
    -delete
sudo rm -rf \
    /usr/share/man \
    /usr/share/groff \
    /usr/share/info/* \
    /usr/share/lintian \
    /usr/share/linda /var/cache/man
sudo find /usr/share/locale \
    -type f \
    ! -name 'en' \
    ! -name 'de*' \
    ! -name 'es*' \
    ! -name 'ja*' \
    ! -name 'fr*' \
    ! -name 'zh*' \
    -delete
sudo find /usr/share/locale \
    -mindepth 1 \
    -maxdepth 1 \
    ! -name 'en*' \
    ! -name 'de*' \
    ! -name 'es*' \
    ! -name 'ja*' \
    ! -name 'fr*' \
    ! -name 'zh*' \
    ! -name 'locale.alias' \
    -exec rm -r {} \;

sudo chown -R ${USER}:${USER} /home/${USER}

# Run sudo w/out password
if [ ! -f /etc/sudoers.d/010_pi-nopasswd ]; then
  echo "${USER} ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/010_${USER}-nopasswd > /dev/null
  sudo chmod 0440 /etc/sudoers.d/010_${USER}-nopasswd
fi

# Pull down and install containers
echo "Pulling, installing, and bringing up containers.."
/home/${USER}/screenly/bin/upgrade_containers.sh

echo -e "Screenly version: $(git rev-parse --abbrev-ref HEAD)@$(git rev-parse --short HEAD)\n$(lsb_release -a)" > ~/version.md

if [ "$WEB_UPGRADE" = false ]; then
  set +x
else
  set +e
fi

echo "Installation completed."

if [ "$WEB_UPGRADE" = false ]; then
  read -p "You need to reboot the system for the installation to complete. Would you like to reboot now? (y/N)" -n 1 -r -s REBOOT && echo
  if [ "$REBOOT" == 'y' ]; then
    sudo reboot
  fi
fi
