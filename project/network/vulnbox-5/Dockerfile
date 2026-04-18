# Vulnbox 5 - Samba (EthernalBlue-era misconfiguration)
# This container runs a Samba server with a misconfiguration that allows for potential exploitation.

FROM dperson/samba

RUN mkdir -p /public /private && \
    chmod 777 /public && \
    chmod 700 /private

ENV USERID=1000 \
    GROUPID=1000

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["-u", "guest;guest", \
     "-s", "public;/public;yes;no;yes;all;none", \
     "-s", "private;/private;no;no;no;all;none"]
