# Copy User Tacacs to freeRadius

Last Tested Script : 17 June 2023
Tested Environment running with this script
  1. Ubuntu 18.04.5 LTS
  2. FreeRADIUS Version 3.0.16
  3. Tacacs
  5. MySQL 5.7.42
  6. Tacacs GUI Version_0.9
  7. daloRadius 2.0

How to Use:

Make sure you already done install  below service in the same server 
  
- Tacgui (https://github.com/tacacsgui/tacacsgui)
  
- daloRadius  (https://github.com/lirantal/daloradius)

Copy the script to your server



Running the script by command

```mysql -u root -p<mysql_root_password> < add_user.sql ```


Or you can running automatically with Triggers with command


```mysql -u root -p<mysql_root_password> < triggers.sql ```


