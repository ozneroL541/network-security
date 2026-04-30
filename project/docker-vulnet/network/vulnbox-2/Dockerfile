# Apache Struts 2.3.31 – CVE-2017-5638
# The Content-Type header is parsed by the Jakarta Multipart parser.
# A malformed value triggers OGNL expression evaluation → unauthenticated RCE.
# This is the exact vulnerability used in the 2017 Equifax breach.

FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install Java 8 + Tomcat 8 + wget
RUN apt-get update -qq && \
    apt-get install -y -qq \
        openjdk-8-jdk-headless \
        wget \
        curl \
        unzip \
        iproute2 && \
    rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV PATH="$JAVA_HOME/bin:$PATH"

# ── Tomcat 8.5 ──────────────────────────────────────────────
ENV TOMCAT_VERSION=8.5.87
ENV CATALINA_HOME=/opt/tomcat

RUN wget -q "https://archive.apache.org/dist/tomcat/tomcat-8/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz" \
        -O /tmp/tomcat.tar.gz && \
    mkdir -p "$CATALINA_HOME" && \
    tar xzf /tmp/tomcat.tar.gz -C "$CATALINA_HOME" --strip-components=1 && \
    rm /tmp/tomcat.tar.gz

# ── Struts 2.3.31 showcase WAR (contains the vulnerable REST plugin) ──
ENV STRUTS_VERSION=2.3.31

RUN wget -q "https://archive.apache.org/dist/struts/${STRUTS_VERSION}/struts-${STRUTS_VERSION}-apps.zip" \
        -O /tmp/struts-apps.zip && \
    unzip -q /tmp/struts-apps.zip "struts-${STRUTS_VERSION}/apps/struts2-showcase.war" \
        -d /tmp/struts-extract/ && \
    cp "/tmp/struts-extract/struts-${STRUTS_VERSION}/apps/struts2-showcase.war" \
        "${CATALINA_HOME}/webapps/struts2-showcase.war" && \
    rm -rf /tmp/struts-apps.zip /tmp/struts-extract

# Remove default Tomcat apps to keep the attack surface clean/focused
RUN rm -rf \
    "$CATALINA_HOME/webapps/ROOT" \
    "$CATALINA_HOME/webapps/docs" \
    "$CATALINA_HOME/webapps/examples" \
    "$CATALINA_HOME/webapps/host-manager" \
    "$CATALINA_HOME/webapps/manager"

# Tomcat manager creds (useful for post-exploit exploration)
COPY tomcat-users.xml "$CATALINA_HOME/conf/tomcat-users.xml"

EXPOSE 8080


CMD ["sh", "-c", "$CATALINA_HOME/bin/catalina.sh run"]
