#! /bin/bash

if [ "`systemctl --user is-active redshift.service`" != "active" ] 
then 
	systemctl --user start redshift.service
else
  systemctl --user stop redshift.service
fi

exit 0
