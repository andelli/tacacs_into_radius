#Create Triggers
  
delimiter //
CREATE TRIGGER insert_RadiusDB AFTER INSERT
ON radiusdb
FOR EACH ROW
DELETE FROM radiusdb.radcheck;
INSERT INTO radiusdb.radcheck
SELECT id, username, CASE login_flag WHEN 0 THEN 'Cleartext-Password' WHEN 3 THEN 'MD5-Password' ELSE 'Unknown' END as attribute,":=" AS op, login AS value FROM tgui.tac_users;

INSERT INTO radiusdb.userinfo(id,username,creationdate,updatedate) 
SELECT id, username,CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP() FROM tgui.tac_users;

DELETE FROM radiusdb.radusergroup;
INSERT INTO radiusdb.radusergroup
SELECT username, IF(message IS NULL,'MK-Read',message) as groupname,0 FROM tgui.tac_users; //
delimiter ;

delimiter //
CREATE TRIGGER insert_RadiusDB AFTER UPDATE
ON radiusdb
FOR EACH ROW
DELETE FROM radiusdb.radcheck;
INSERT INTO radiusdb.radcheck
SELECT id, username, CASE login_flag WHEN 0 THEN 'Cleartext-Password' WHEN 3 THEN 'MD5-Password' ELSE 'Unknown' END as attribute,":=" AS op, login AS value FROM tgui.tac_users;

INSERT INTO radiusdb.userinfo(id,username,creationdate,updatedate) 
SELECT id, username,CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP() FROM tgui.tac_users;

DELETE FROM radiusdb.radusergroup;
INSERT INTO radiusdb.radusergroup
SELECT username, IF(message IS NULL,'MK-Read',message) as groupname,0 FROM tgui.tac_users; //
delimiter ;

delimiter //
CREATE TRIGGER insert_RadiusDB AFTER DELETE
ON radiusdb
FOR EACH ROW
DELETE FROM radiusdb.radcheck;
INSERT INTO radiusdb.radcheck
SELECT id, username, CASE login_flag WHEN 0 THEN 'Cleartext-Password' WHEN 3 THEN 'MD5-Password' ELSE 'Unknown' END as attribute,":=" AS op, login AS value FROM tgui.tac_users;

INSERT INTO radiusdb.userinfo(id,username,creationdate,updatedate) 
SELECT id, username,CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP() FROM tgui.tac_users;

DELETE FROM radiusdb.radusergroup;
INSERT INTO radiusdb.radusergroup
SELECT username, IF(message IS NULL,'MK-Read',message) as groupname,0 FROM tgui.tac_users; //
delimiter ;
