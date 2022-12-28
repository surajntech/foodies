FROM jcrhub.com/docker/ubuntu:20.04
ENV JAVA_HOME=/u01/middleware/jdk-11
ENV TOMCAT_HOME=/u01/middleware/apache-tomcat-9.0.62
ENV PATH=${PATH}:${JAVA_HOME}/bin:${TOMCAT_HOME}/bin

RUN mkdir -p /u01/middleware

WORKDIR /u01/middleware
ADD https://download.java.net/openjdk/jdk11/ri/openjdk-11+28_linux-x64_bin.tar.gz .
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.62/bin/apache-tomcat-9.0.62.tar.gz .
EXPOSE 8080
RUN tar -xzvf openjdk-11+28_linux-x64_bin.tar.gz
RUN rm openjdk-11+28_linux-x64_bin.tar.gz
RUN tar -xzvf apache-tomcat-9.0.62.tar.gz
RUN rm apache-tomcat-9.0.62.tar.gz
COPY target/foodies.war apache-tomcat-9.0.62/webapps
COPY tomcat-start.sh .
RUN chmod u+x tomcat-start.sh
ENTRYPOINT [ "./tomcat-start.sh" ]
CMD [ "tail -f /dev/null" ]
