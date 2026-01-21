FROM eclipse-temurin:17-jre
EXPOSE 8080
ARG target/spring-boot-jenkins-docker-integration-sample.jar
ENTRYPOINT [ "java","-jar","/spring-boot-jenkins-docker-integration-sample.jar" ]
