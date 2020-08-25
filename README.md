Wogsland.org
============
This is the code for our family website. Contributions welcome!

Named Directories
-----------------

These are going away in favor of firstname.wogsland.org repositories:

https://github.com/wogsland/zara.wogsland.org/  
https://github.com/wogsland/maxwell.wogsland.org/  
https://github.com/wogsland/brittan.wogsland.org/  
https://github.com/wogsland/alora.wogsland.org/  

Other Directories
-----------------

In addition to individuals named directories, there are a number of other directories which serve various purposes outlined below:

### articles
These are articles from the 2006 version of the website. Please leave them as is.

### genealogy
This directory contains the genealogical history of our family stored in HTML files. A lot of work went into collecting the information and converting it into the current format though there are obviously better, more dynamic ways to store information. If you'd like to implement one, fork a branch off before going to town.

### images
Top-level image directory.

### memories
Same comment as "articles".

### photos
Rooted in a distrust for Shutterfly, this is a place for photos. The convention is year/month/ directories holding files identified by the date and time they were taken, e.g. 2013/08/2013-08-07_15-04-23_156.jpg was taken on August 7th, 2013 at 3:04 in the afternoon. If space constraints become an issue directories for days may be added. Also, there is no nice way to view these right now. It would be great if somebody built one...

### physics
Bradley's physics information. This should really be in http://bradley.wogsland.org/physics, but because the physics community references it has been left here. Delusions of granduer...

### recipes
Same comment as "articles".

### url
This is a fully functioning URL shortener. Please don't break it. It is forked off of the [YOURLS](https://yourls.org/) project with some modifications.

Deployment
-----------------

### Apache
The production setup includes Apache configuration files for the sites in  
`/etc/httpd/sites-available` and links enabling those sites in `/etc/httpd/sites-enabled`.
For example the main site is configured like

    <VirtualHost *:80>

        ServerAdmin bradley@wogsland.org
        ServerName wogsland.org
        ServerAlias www.wogsland.org
        #ServerAlias *.wogsland.org
        DocumentRoot /var/www/Wogsland.org/public  

        <Directory /var/www/Wogsland.org/public/>
                Options -Indexes +FollowSymLinks +MultiViews
                AllowOverride All
                Order allow,deny
                allow from all
        </Directory>

        # Possible values include: debug, info, notice, warn, error, crit,
        # alert, emerg.
        LogLevel warn

    </VirtualHost>

Bot not this yet:

    <VirtualHost *:443>
        ServerAdmin bradley@wogsland.org
        ServerName wogsland.org
        ServerAlias www.wogsland.org
        DocumentRoot /var/www/Wogsland.org/public
        SSLEngine on
        SSLCertificateFile <something tbd>
        SSLCertificateKeyFile <something tbd>
        SSLCertificateChainFile <something tbd>

        <Directory /var/www/Wogsland.org/public>
             Options +Indexes +FollowSymLinks +MultiViews
             AllowOverride All
             Order allow,deny
             allow from all
        </Directory>

        # Possible values include: debug, info, notice, warn, error, crit,
        # alert, emerg.
        LogLevel warn
    </VirtualHost>


Similar files & links for each of the named directory family members are also
there. When making Apache changes,

    apachectl restart

### Automagicness (or, lies)
Deployment is accomplished automagically via a Github webhook that hits and endpoint which runs the `deploy.sh` script.
