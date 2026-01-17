FROM eclipse-temurin:17-jre
EXPOSE 9999
ARG target/spring-boot-jenkins-docker-integration-sample.jar
ENTRYPOINT [ "java","-jar","/spring-boot-jenkins-docker-integration-sample.jar" ]
