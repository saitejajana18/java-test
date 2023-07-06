FROM maven:3.5.4-jdk-8-alpine as packagee
COPY ./pom.xml ./pom.xml
COPY ./src ./src
RUN mvn clean package
FROM java:openjdk-8
FROM tomcat:latest
WORKDIR /application-6.0
EXPOSE 1800
COPY --from=packagee target/sample-*.jar ./sample.jar .
CMD ["java", "-jar", "./sample.jar"]