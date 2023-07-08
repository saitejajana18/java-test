FROM maven:3.5.4-jdk-8-alpine as packagee
COPY ./pom.xml ./pom.xml
COPY ./src ./src
RUN mvn clean package
FROM openjdk:11-jre
WORKDIR /application-6.0
EXPOSE 1900
COPY --from=packagee ./target/sample-*.jar .
CMD ["java", "-jar", "/application-6,0/sample-1.0.3.jar"]


