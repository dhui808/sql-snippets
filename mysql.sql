LOAD DATA LOCAL INFILE  
'/usr/myData.csv'
INTO TABLE investing_staging_oil_wti
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(date_str, price, open, high, low, vol, change_percentage);

INSERT INTO investing_history SELECT 'OIL', date_format(str_to_date(source.date_str,'%M %d, %Y'), '%Y%m%d'), source.price  from investing_staging_oil_wti source;
