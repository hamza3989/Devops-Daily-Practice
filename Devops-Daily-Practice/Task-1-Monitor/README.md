I have created a background monitoring daemon that continously check server's health.
It continously run in a 60 second loop that track RAM and Root disk usage.
It generates structured logs in INFO, WARNING, CRITICAL.INFO.
Runs background with auro start.
