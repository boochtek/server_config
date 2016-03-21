* Disable RPC ports
* Stuff from http://wiki.boochtek.com/build/misc
* Ansible stuff
    * Use blockinfile in some places instead of lineinfile
        * Useful for when we want blank lines separating and comments
    * Combine some tasks using with_items
        * We can use - { x: 'val', y: 'val' } then use {{ item.x }} and {{ item.y }}
    * Could we write Ansible modules to do if/case statements? Multiple commands?
* Postfix fixes
    * Had some problem restarting the service
    * Make sure outbound emails are actually getting sent
    * Do we need any of the stuff from https://github.com/debops/ansible-postfix?
    * Should we just copy the whole config file instead of using lineinfile?
    * Enable MSA (Mail Submission Agent) on port 587 for outbound emails from our domains.
        * Don't forget to open the firewall
        * What's the difference between that and LMTP?
    * STARTTLS
        * What do we do about SSL certificates? Will letsencrypt work?
* Nginx fixes
    * Add 404 and 50x error pages
    * Install and configure TLS and letsencrypt
        * Include redirect from HTTP to HTTPS
    * Configure to run in a chroot jail, if we can
    * Figure out where to put log files
    * Rotate log files daily (for privacy of users)
        * Gather web stats before we rotate log files
* Dokuwiki
    * Make sure to require logins to edit
* Middleman or Hugo
* Backups
* Monitoring
* Check log rotation
* Web metrics
* Move all web sites over
    * Boochtek
    * Boochtek wiki
    * Boochtek blog
    * Personal blog
    * Personal site
* Local email delivery
    * Use maildir format
* IMAPD
* Receive emails through Postfix
    * Don't forget to bind to 0.0.0.0
    * Don't forget to open the firewall
    * Add spam filtering
    * Add greylisting
* What else can we learn from https://github.com/debops?
* Test server configs using ServerSpec
* iTunes server
