# Docker con multi-stage (o docker-in-docker)
# Docker para compilar la aplicación java de payment-service-example 

FROM maven:3.6-jdk-8-alpine AS builder
COPY . /app
WORKDIR /app
RUN mvn -e -B package


# Segundo docker del multi-stage
# Instrucciones para ejecutar el código compilado 

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=builder app/target /app/target
CMD ["java", "-jar", "/app/target/shipping-service-example-0.0.1-SNAPSHOT.jar"]
