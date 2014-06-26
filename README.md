Disk usage checker for Salt Stack
================

SaltStack is an Open Source Software for configuration management, infrastructure automation and cloud orchestration. It can be used to mass control many machines and configure them or work on them parallely.

This script can be used to check the disk space on each machine and send a mail to the admin, here known as the salt master when the disk space available is less than 25%.

Add this script in /srv/salt and the following lines must be uncommented in the master file (usually located in /etc/salt/master)

file_roots:
    base:
       - /srv/salt

To execute this file, as a salt master, run the following command:

$ sudo salt '*' cmd.script salt://diskchecker.sh


##Optional:

If you want to run this as a cronjob, then you can save this command in a bash script file and save that file in /etc/cron.d and add the cronjob in /etc/crontab as
59 23 * * * root name-of-the-file.sh 


Important
========
1. You will need to install swaks packages
2. Remember to edit the code and add your mail server ip, senders id, receivers id, senders username and password.
