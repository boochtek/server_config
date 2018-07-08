* Have to do the DNS updates before the CERTBOT certs
* Save the Lua stuff this time!
* Do another run of ocean2 from scratch (tear it down all the way)
* Use `apt: name: -one; -two` instead of `with_items`
* Fix this error (in config_files):
    * `warning: GREP_OPTIONS is deprecated; please use an alias or script`
* Convert Dokuwiki stuff to Hugo (don't forget history)
    * BoochTek wiki
    * Personal site
* Convert WordPress stuff to Hugo (don't forget metadata)
    * BoochTek blog
    * Personal blog
* Move all web sites over
    * BoochTek wiki
    * BoochTek blog
    * Personal blog
    * Personal site
* Delete sites from old server
* Ansible stuff
    * Use blockinfile in some places instead of lineinfile
        * Useful for when we want blank lines separating and comments
    * Combine some tasks using with_items
        * We can use - { x: 'val', y: 'val' } then use {{ item.x }} and {{ item.y }}
    * Use includes and variables to pull out tasks common to every web site config.
    * Could we write Ansible modules to do if/case statements? Multiple commands?
* Configure root emails to get forwarded somewhere useful
* Nginx fixes
    * Make sure it works when building a server from scratch
    * Make sure it starts on boot
    * Test against SSL Labs
        * Only thing we're missing is DNS Certification Authority Authorization
            * DNSimple supports CAA records
    * Add custom 404 and 50x error pages
    * Configure to run in a chroot jail, if we can
    * Figure out where to put log files
    * Rotate log files daily (for privacy of users)
        * Gather web stats before we rotate log files
    * Compile NAXSI and/or mod_security module
        * Enable some security filtering


* BACKUPS!!!!
    * Copy most of tarsnap role from https://github.com/sovereign/sovereign
    * Check restoring
        * Individual files
        * To a whole new server
    * Need to do this before we move emails


* Disable RPC ports
* Monitoring
* Fail2ban
* Check log rotation
* Web metrics


* GitLab
    * Private config files
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
* Email
    * Copy most of the stuff from https://github.com/sovereign/sovereign/roles/mailserver
    * Copy most of the stuff from https://github.com/sovereign/sovereign/roles/webmail
* Local email delivery
    * Use maildir format
* IMAPD
    * Can get newer Dovecot and SpamAssassin from backports
* Receive emails through Postfix
    * Don't forget to bind to 0.0.0.0
    * Don't forget to open the firewall
    * Add spam filtering
        * SpamAssassin
        * ClamAV
    * Add greylisting
    * Add SPF records
        * DNSimple supports SPF records
        * SPF records are deprecated, but the TXT record variant is still viable
    * Add DMARC records
        * May require setting up SPF and DKIM
* Picture gallery
    * Middleman or Hugo
        * http://themes.gohugo.io/grid-side/#creating-a-gallery-image
        * https://github.com/icecreammatt/hugo-gallery
        * https://github.com/AmoebaLabs/middleman-image-gallery
        * https://github.com/sowcow/middleman-galley
* What else can we learn from https://github.com/debops?
* Try http://wallabag.org for saving web pages to read later
* Test server configs using ServerSpec
* iTunes server
* Replace NTP server with openntpd?
* Webmail
    * Can get newer roundcube from backports
* CASino for authentication.
* Something that uses CASino.
    * Retro temperature metrics
        * Try with and without a proxy in front.
        * Proxy to make it appear as 1 app.
* OwnCloud or something similar
    * File server
    * Calendar
    * Contacts
* RSS Feed reader?
