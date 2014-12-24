#!/bin/bash
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "------------------------------------------------------------------"
echo "________[*]           Bottl Security Team            [*]__________"
echo "------------------------------------------------------------------"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo
echo "[*] AIDE Installation Automator - PART2"
echo "_______________________________"
echo " -> Please be sure to edit this script and include your email address"
sleep 3
echo "----->Configuring AIDE now"
sleep 3
sed -i 's/^Checksums.*/Checksums = sha512+tiger/' /etc/aide/aide.conf
sed -i 's/MAILTO=root/MAILTO=enter@youremail.com/' /etc/default/aide
sed -i 's/COPYNEWDB=no/COPYNEWDB=yes/' /etc/default/aide
sed -i 's/FILTERUPDATES=no/FILTERUPDATES=yes/' /etc/default/aide
sed -i 's/FILTERINSTALLATIONS=no/FILTERINSTALLATIONS=yes/' /etc/default/aide
sleep 2
aideinit
mv /var/lib/aide/aide.db.new /var/lib/aide/aide.db
/etc/cron.daily/aide
