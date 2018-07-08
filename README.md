Server Setup
============

This repo is used to set up our servers.

You'll need authentication tokens for Digital Ocean and DNSimple.
Set them in environment variables
(`DIGITALOCEAN_TOKEN`, `DNSIMPLE_ACCOUNT`, `DNSIMPLE_TOKEN`).


To create the servers (WARNING: THIS WILL DELETE ANY EXISTING SERVER!):

~~~ shell
terraform apply web
~~~

To update the servers:

~~~ shell
ansible-playbook -K -b -i 'ocean2.boochtek.com,' web/main.yml
~~~
