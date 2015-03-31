# Install #

## 1.  Generate a Github API token ##

    Github > Personal Settings > Applications > Generate new token (Personal access tokens)

You should have the following access for your token: 
 
 * repo
 * public_repo
 * gist
 * user

**Make sure you copy the key highlighted in GREEN! This is the only time you can see this token from Github** 

Add this into ~/.bash_profile  

`export GITHUB_API_TOKEN=[Your API token]`

finally,  

`$ source ~/.bash_profile`

## 2.  Ensure you meet these requirements ##

* Have a github account
* Junos pulse (VPN access)
* Xcode command line tools

`$ xcode-select --install`

## 3.  Clone the repository ##

    $ sudo mkdir -p /opt/boxen
    $ sudo chown root:staff /opt
    $ sudo chmod 775 /op	t
    $ sudo chown samson.nguyen:staff /opt/boxen
    $ git clone https://github.com/samsonnguyen/solium-boxen.git /opt/boxen/repo

## 4. Run the script the first time. This will FAIL ##

    cd /opt/boxen/repo
    ./script/boxen

It will ask you for a github login:
Enter in your github username and password

The first time boxen/puppet will fail while checking out shareworks! This is normal, but it should install the gem subsystem for us to continue to the next step:

## 5.  Install hiera and generate a new private key for your encrypted eyaml files ##

    $ sudo gem install hiera-eyaml
    $ cd /opt/boxen/
    $ eyaml createkeys
      [hiera-eyaml-core] Created key directory: ./keys
      [hiera-eyaml-core] Keys created OK
    
    KEY THESE KEYS SAFE!

## 6. Now lets encrypt our active-directory password so that we can add it into configuration file ##

    $ cd /opt/boxen/
    $ eyaml encrypt -p
    Enter password: *********
    string: ENC[PKCS7,MIIBeQYJKoZIhvcNAQcDoIIBajCCAWYCAQAxggEhMIIBHQIBADAFMAACAQEwDQYJKoZIhvcNAQEBBQAEggEAXwS2wJh4tFIbEPc3tZtxX1f31urwwSneV0BD6yiBmgrw3peNItg1qpHmBl53pLFJqgnPNC9g+GmpcZswOsdfC6b93GZjHQeiN1JC6VRPuHGkPlNXd6rY7tso8LEV7vpPOzfk6QjwmRLSbHuG38CZtlNBw7NREr9wZvJuDu2na3xGf1z7YQt/aRlhIfA54qADcgDcL1N06/i+1fcCNlXqEsDbwTto8BjnRk8xyKXPTAYTJnnz7LSSV331khlQvwWVNjormNus63RK4Re2J23FmcG/XUi7dD9U/HDJwUuGIXJg0DK4b7sdfTFSqddSqkm0OuBHpqrNKAom30w9x7XgZBxvloLDA8BgkqhkiG9w0BBwEwHQYJYIZIAWUDBAEqBBAZ+oBkHuAhjyoIdxG2kwf/gBDc5WHlMlsdf0CUxfsaz0w6R7c]
    
    OR
    
    block: >
        ENC[PKCS7,MIIBeQYJKoZIhvcNAQcDoIIBajCCAWYCAQAxggEhMIIBHQIBADAFMAACAQEw
        DQYJKoZIhvcNAQEBBQAEggEAXwS2wJh4tFIbEPc3tZtxX1f31urwwSneV0BD
        6yiBmgrw3peNItg1qpHm3pLFJqgnPNC9g+GmpcZswOC6b93sdfGZjHQeiN1J
        C6VRPuHGkPlNXd6rY7tso8LEV7vpPOzfk6QjwmRLSbHuG38CZtlNBw7NREr9
        wZvJuDu2na3xGf1z/aRlhIfA54asdfqADcgDcL1N06/i+1fcCNlXqEsDbwTt
        o8BjnRk8xyKXPTAYTJnnz7LSSV331khlQvwWVNjormNus63RK4Re2J23FmcG
        /XUi7dD9U/HDJwUuGIXJg0DK4b7TFSqddSqkm0OuBHpqrNKAom30w9x7XgZB
        xvloLDA8BgkqhkiG9w0BBwEwHQYJYIZIAWUDBAEqBBAZ+oBkHuAhjyoIdxG2
        kwf/gBDc5WHlMl0CUxfsaz0w6R7c]

## 7. Add your encrypted password into the repository ##

    $ cd /opt/boxen/repo
    $ git branch add-samson
    $ git checkout add-samson

## 8. Ensure you are on the Solium network ##

Start up Juno pulse and ensure you can access [live01](live01.solium.com)

## 9. Accept the un-trusted SSL certificate permanently ##

    $ svn list https://svn.solium.com/svn/shareworks/branches

Accept the certificate

## 9. Try running boxen again ##

    $ cd /opt/boxen/repo
    $ ./script/boxen     ## This might take a while..

# Common Problems #

Error:  

`Server certificate verification failed: issuer is not trusted (https://svn.solium.com)`

Run this command:

`svn list https://svn.solium.com/svn/shareworks/branches`

and accept the SSL certificate permanently.  

