FROM openjdk:8-jdk-alpine

WORKDIR /app

COPY /build/libs/*.jar /app/

EXPOSE 8080

ENTRYPOINT ["java", "-Dspring.profiles.active=nodb", "-jar", "/app/demo-0.0.3-SNAPSHOT.jar"]
