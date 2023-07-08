FROM maven:3.5.4-jdk-8-alpine as packagee
WORKDIR /artifacts
COPY . .
RUN mvn clean package
FROM java:openjdk-8
FROM tomcat:latest
WORKDIR /app
EXPOSE 1800
COPY --from=packagee artifacts/target/sample-*.jar .
CMD ["java", "-jar", "./sample-1.0.3.jar"]