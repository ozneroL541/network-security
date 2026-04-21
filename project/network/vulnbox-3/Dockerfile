# Vulnbox 3 – DVWA
# Damn Vulnerable Web Application (DVWA) is a PHP/MySQL web app designed for security training.
# It contains multiple vulnerabilities of varying difficulty, making it ideal for practice.

FROM vulnerables/web-dvwa

ENV MYSQL_PASS=p@ssw0rd
ENV HOSTNAME=vulnbox3

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
#ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 80 443
