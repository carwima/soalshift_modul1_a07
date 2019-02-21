awk '/!sudo/&&/cron/||/CRON/' /var/log/syslog | awk 'NF <13' >> ~/modul1/syslogno5.log
