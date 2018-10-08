# Dockerizing Mule Management Console
# Version:  3.0

FROM rhel
MAINTAINER sureshkumar

# Copy configuration files
WORKDIR /opt

COPY mulesoft  .

RUN yum install wget-1.14-15.el7_4.1.x86_64.rpm -y

# Define java environment variables
ENV JAVA_HOME=/opt/java
ENV PATH="$PATH:$JAVA_HOME/bin"

RUN yum install jdk-8u181-linux-x64.rpm -y

# Define environment variables
ENV MULE_HOME /opt/mule

# Define mount points
VOLUME [" /opt/mule/logs", "/opt/mule/conf", "/opt/mule/apps", "/opt/mule/domains" ]

# Default http port
EXPOSE 8084

# Define working directory
WORKDIR /opt/mule/bin

RUN ./mule start


