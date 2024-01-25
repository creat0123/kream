FROM alpine:latest

RUN apk --no-cache add openjdk17 maven curl

WORKDIR /app

COPY .mvn/wrapper/maven-wrapper.jar .mvn/wrapper/maven-wrapper.jar
COPY .mvn/wrapper/maven-wrapper.properties .mvn/wrapper/maven-wrapper.properties
COPY mvnw ./
COPY mvnw.cmd ./
COPY pom.xml ./

RUN chmod +x mvnw && ./mvnw dependency:resolve

COPY src ./src

CMD ["./mvnw", "spring-boot:run"]
