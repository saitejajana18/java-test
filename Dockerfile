FROM docker pull maven AS packagee
COPY . .
RUN mvn clean package
RUN docker pull java
WORKDIR /app
COPY --from=packagee ./target/sample-*.jar .