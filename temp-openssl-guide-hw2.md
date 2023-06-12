### Temporary file for OpenSSL guide (HW2)

Instructions assume you already have OpenSSL installed.

For (Q1-a):
We want to simply connect to a website and get the certificate information, for this step we simply use the following command:
`openssl s_client -showcerts www.amazon.com:443 > exported-cert-data.crt`

You can name the file whatever you want, but make sure the extension is either `.crt` or `.pem`.

Once you run that command, you might need to force an exit of the connection since you already the information redirected ">" to the file "exported-cert-data.crt".

Notice that on my screenshot below there is a "^C" that means I pressed `Control+C` to cancel out / exit out of the openssl s_client connection to www.amazon.com for the purpose of getting the certificate info I needed.

![image](https://github.com/ealmonte32/ealmonte32.github.io/assets/24350198/f1f01e9d-1e91-471b-8310-ad29125b093f)

Then, to view the information better, we can use the following OpenSSL command:
`openssl x509 -in exported-cert-data.crt -text`

As you can see from the screenshow below, the information shows you who the issuer of the certificate is (DigiCert Inc), and who the certificate was issued to (Subject):

![image](https://github.com/ealmonte32/ealmonte32.github.io/assets/24350198/48e2bfef-ce60-4af6-8c27-ecbf20f5baa9)
