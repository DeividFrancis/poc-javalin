FROM maven as builder
WORKDIR /app
COPY . .
RUN mvn package

FROM openjdk:25-oraclelinux9
WORKDIR /app

COPY --from=builder /app/pocjavalin.jar /app/pocjavalin.jar

EXPOSE 7070

ENTRYPOINT [ "java", "-jar", "pocjavalin.jar" ]