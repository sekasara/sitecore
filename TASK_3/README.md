## Steps followed to resolve the issue:

### Step 1
Tried to Start the Redis Service
`systemctl start redis-server`

### Step 2
Verified the Redis Service Status
`systemctl status redis-server`
It seems getting failed at starting Redis Service

### Step 3
Verified the log using `journalctl -xe`  
It clearly shows that there is some configuration issue.  
Oct 10 03:44:00 sekar-lnx redis-server[15032]: *** FATAL CONFIG FILE ERROR ***  
Oct 10 03:44:00 sekar-lnx redis-server[15032]: Reading the configuration file, at line 108  
Oct 10 03:44:00 sekar-lnx redis-server[15032]: >>> 'logfile /var/log/redis-server.log'  
Oct 10 03:44:00 sekar-lnx redis-server[15032]: Can't open the log file: Read-only file system  

It looks like issue with file permission of `/var/log/redis-server.log` (/var/log folder requires root permission)

### Step 4
Changed the logfile path in redis configuration file `/etc/redis/redis.conf`  
logfile `/var/log/redis/redis-server.log` (folder /var/log/redis/, which is already has required file permission)

### Step 5
Once modifying the configuration, tried to restart the server. And now it is working fine.  
`systemctl start redis-server`