my.ini file in mysql home:
  [mysqld]
  # set basedir to your installation path
  basedir=C:/software/mysql-8.0.23-winx64
  # set datadir to the location of your data directory
  datadir=C:/mydata

  [mysql]
  local_infile=1
Data directory initialization
  bin\mysqld --initialize-insecure --console
##############################################################
start mysql server
  mysqld --local_infile=1
log in to mysql server and use a specific schema (databse)
  mysql -u root -p --local-infile financial_products
  
export database
  mysqldump -u root -p financial_products > mysql.sql
import mysql database
  mysql -u root -p -h localhost financial_products < mysql.sql

LOAD DATA LOCAL INFILE  
'/usr/myData.csv'
INTO TABLE investing_staging_oil_wti
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(date_str, price, open, high, low, vol, change_percentage);

INSERT INTO investing_history SELECT 'OIL', date_format(str_to_date(source.date_str,'%M %d, %Y'), '%Y%m%d'), source.price  from investing_staging_oil_wti source;
