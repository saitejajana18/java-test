FROM maven:3.3-jdk-8-alpine as packagee
WORKDIR /application-1.0
COPY ./pom.xml ./pom.xml
COPY ./src ./src
RUN mvn clean package
FROM java:openjdk-8
FROM tomcat:latest
EXPOSE 1800
COPY --from=packagee target/sample-1.0.3.jar ./sample-1.0.3.jar .
CMD ["java", "-jar", "./sample-1.0.3.jar"]