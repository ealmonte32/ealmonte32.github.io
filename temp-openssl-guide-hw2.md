### Temporary file for OpenSSL guide (HW2)

Instructions assume you already have OpenSSL installed.

For (Q1-a):
We want to simply connect to a website and get the certificate information, for this step we simply use the following command:<br>
`openssl s_client -showcerts www.amazon.com:443 > exported-cert-data.crt`

You can name the file whatever you want, but make sure the extension is either `.crt` or `.pem`.

Once you run that command, you might need to force an exit of the connection since you already have the information redirected ">" to the file "exported-cert-data.crt".

Notice that on my screenshot below there is a "^C" towards the bottom of console output, that means I pressed `Control+C` to cancel out / exit out of the openssl s_client connection to www.amazon.com for the purpose of getting the certificate info I needed.

![image](https://github.com/ealmonte32/ealmonte32.github.io/assets/24350198/f1f01e9d-1e91-471b-8310-ad29125b093f)

Then, to view the information better, we can use the following OpenSSL command:<br>
`openssl x509 -in exported-cert-data.crt -text`

As you can see from the screenshow below, the information shows you who the issuer of the certificate is (DigiCert Inc), the validity date (when the certificate was issued and when it expires), and who the certificate was issued to (Subject), are just some of the important information displayed:

![image](https://github.com/ealmonte32/ealmonte32.github.io/assets/24350198/48e2bfef-ce60-4af6-8c27-ecbf20f5baa9)

---

For (Q1-b):
We now need to create our own Root CA (Certificate Authority), like if we were DigiCert, and we need to issue a certificate to some website that requests it, for example a website called "`msu-csit560.com`":

We start by taking care of creating our Root CA stuff, starting with generating an RSA private key with 2048 bits:<br>
`openssl genrsa -out myRootCA.key 2048`

![image](https://github.com/ealmonte32/ealmonte32.github.io/assets/24350198/8927eba7-d710-4dd8-ab88-3fcd81aa4cc1)

Then, we create a certificate for our Root CA using our private key we previously created (I am simplifying the step by omitting other parameters like `-days` which is used to set how long the certificate is valid for, and what hashing algorithm to use `-sha256`):<br>
`openssl req -new -x509 -key myRootCA.key -out myRootCA.crt`

![image](https://github.com/ealmonte32/ealmonte32.github.io/assets/24350198/54fb946c-4bbf-4a34-9827-893ad8d0d5bb)

When this is done, we have two files, our Root CA private key, and our Root CA certificate:<br>
`myRootCA.key` and `myRootCA.crt`

Now, we will be issuing a certificate for that sample website mentioned before, `msu-csit560.com`, and then creating a CSR which means certificate signing request:<br>
`openssl genrsa -out msu-csit560.com.key 2048`<br>
then<br>
`openssl req -new -key msu-csit560.com.key -out msu-csit560.com.csr`

![image](https://github.com/ealmonte32/ealmonte32.github.io/assets/24350198/dfe34d43-6994-4361-96b8-5b625da7aadb)

As you can see from the previous screenshot, we generated the private key and then we created a csr specifically for the sample website.

Now, we will be acting as the Certificate Authority with our myRootCA files, and we are going to sign and issue the certificate for the sample website:<br>
`openssl x509 -req -in msu-csit560.com.csr -CA myRootCA.crt -CAkey myRootCA.key -CAcreateserial -out msu-csit560.com.crt`

![image](https://github.com/ealmonte32/ealmonte32.github.io/assets/24350198/480c1f89-8197-43b1-94d6-8f0d27976e62)

Then, if we use the command to inspect a certificate, we can see that our Root CA was the one that issued the certificate and who we issued it to:<br>
`openssl x509 -in msu-csit560.com.crt -text`

![image](https://github.com/ealmonte32/ealmonte32.github.io/assets/24350198/ee3bfc78-2def-4ec2-a8ff-f86181b694ad)
<br>
<br>
`By: Emyll Almonte`
