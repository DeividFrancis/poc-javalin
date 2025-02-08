FROM maven:latest as builder
WORKDIR /
COPY . .
RUN mvn package

FROM eclipse-temurin:21-alpine-3.21
COPY --from=builder /target/app.jar /app.jar

EXPOSE 7000 
ENTRYPOINT ["java", "-jar", "/app.jar"]