#!/bin/bash
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "------------------------------------------------------------------"
echo "________[*]           Bottl Security Team            [*]__________"
echo "------------------------------------------------------------------"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo
echo "[*] AIDE Installation Automator - PART1"
echo "_______________________________"
sleep 3
echo "----->Configuring AIDE now"
apt-get install expect -y
AIDESETUP=$(expect -c "
set timeout 10
spawn apt-get install aide -y
expect \"<Ok>\"
send \"\r\"
expect \"<Ok>\"
send \"\r\"
expect eof
")
echo "$AIDESETUP"
sleep 2
echo "Please run aide-automator-2.sh now!"
