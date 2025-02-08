FROM maven:3.6.3-jdk-11 as builder
WORKDIR /
COPY . .
RUN mvn package

FROM eclipse-temurin:11-alpine
COPY --from=builder /target/app.jar /app.jar

EXPOSE 7000 
ENTRYPOINT ["java", "-jar", "/app.jar"]