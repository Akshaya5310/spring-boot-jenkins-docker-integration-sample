FROM openjdk:17
EXPOSE 9999
ARG target/spring-boot-jenkins-docker-integration-sample.jar
ENTRYPOINT [ "java","-jar","/spring-boot-jenkins-docker-integration-sample.jar" ]