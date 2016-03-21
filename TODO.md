* Disable RPC ports
* Configure root emails to get forwarded somewhere useful
* Stuff from http://wiki.boochtek.com/build/misc
* Backups
* Monitoring
* Check log rotation
* Web metrics
* Ansible stuff
    * Use blockinfile in some places instead of lineinfile
        * Useful for when we want blank lines separating and comments
    * Combine some tasks using with_items
        * We can use - { x: 'val', y: 'val' } then use {{ item.x }} and {{ item.y }}
    * Use includes and variables to pull out tasks common to every web site config.
    * Could we write Ansible modules to do if/case statements? Multiple commands?
* Postfix fixes
    * "Configure Postfix networks allowed to relay through us" is showing as changed every time.
    * Had some problem restarting the service
    * Do we need any of the stuff from https://github.com/debops/ansible-postfix?
    * Should we just copy the whole config file instead of using lineinfile?
    * Enable MSA (Mail Submission Agent) on port 587 for outbound emails from our domains.
        * Don't forget to open the firewall
        * What's the difference between that and LMTP?
    * STARTTLS
        * What do we do about SSL certificates? Will letsencrypt work?
        * Could we use HAProxy or Nginx in front of Postfix to do TLS?
* Nginx fixes
    * Add 404 and 50x error pages
    * Install and configure TLS and letsencrypt
        * Include redirect from HTTP to HTTPS
    * Configure to run in a chroot jail, if we can
    * Figure out where to put log files
    * Rotate log files daily (for privacy of users)
        * Gather web stats before we rotate log files
* Dokuwiki
    * Could we just convert everything (including history) to Middleman or Hugo?
    * Make sure to require logins to edit anything
* Middleman or Hugo
* Move all web sites over
    * Boochtek
    * Boochtek wiki
    * Boochtek blog
    * Personal blog
    * Personal site
* Jenkins
* GitLab
    * Private config files
* Local email delivery
    * Use maildir format
* IMAPD
* Receive emails through Postfix
    * Don't forget to bind to 0.0.0.0
    * Don't forget to open the firewall
    * Add spam filtering
        * SpamAssassin
        * ClamAV
    * Add greylisting
* What else can we learn from https://github.com/debops?
* Test server configs using ServerSpec
* iTunes server
* Replace NTP server with openntpd?
