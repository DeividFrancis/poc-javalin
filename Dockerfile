FROM maven as builder
WORKDIR /
COPY . .
RUN mvn package

FROM openjdk:25-oraclelinux9
COPY --from=builder /target/app.jar /app.jar

EXPOSE 7000 
ENTRYPOINT ["java", "-jar", "/app.jar"]