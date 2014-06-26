#!/bin/bash


df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 " " $6 }' | while read output;

do
  echo $output
  usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
  partition=$(echo $output | awk '{ print $2 }' )
  mountpoint=$(echo $output | awk '{ print $3 }')
  if [ "$usep" -gt 70 ];
         then
           swaks -s mail.server.ip -f sendersid@domain.com -t receiversid@domain.com -au 'sendersid@domain.com' -ap 'mypassword' --data "To: sendersid@domain.com \nFrom:receiversid@domain.com \nSubject: LOW SPACE ALERT \nX-Mailer: swaks v$p_version jetmore.org/john/code/#swaks \nRunning out of space \"$partition ($usep%)\", mount point $mountpoint , on $(hostname -f) as on $(date) \n"
        else
           echo "safe" 
  fi
done
