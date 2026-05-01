# Vulnbox 1 - Log4Shell
# Pivot node for networking
FROM maven:3.9.9-eclipse-temurin-8 AS build

WORKDIR /build
COPY pom.xml .
RUN mvn -q -e -DskipTests org.apache.maven.plugins:maven-dependency-plugin:3.3.0:go-offline

COPY src ./src
RUN mvn -q -DskipTests package

# ---- runtime ----
FROM eclipse-temurin:8-jre-jammy

# install tools for your lab
RUN apt-get update && \
    apt-get install -y -qq iproute2 curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY --from=build /build/target/vulnapp-1.0-jar-with-dependencies.jar .

EXPOSE 8080

CMD ["java", "-jar", "vulnapp-1.0-jar-with-dependencies.jar"]
