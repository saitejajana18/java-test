FROM maven:3.5.4-jdk-8-alpine as packagee
WORKDIR /application-4.0
COPY ./pom.xml ./pom.xml
COPY ./src ./src
RUN mvn clean package
FROM java:openjdk-8
FROM tomcat:latest
EXPOSE 4800
COPY --from=packagee target/sample-*.jar ./sample.jar .
CMD ["java", "-jar", "./sample-1.0.3.jar"]