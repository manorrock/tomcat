FROM manorrock/openjdk
ENV TOMCAT_VERSION=9.0.27
RUN apt-get update && \
    apt-get install -y curl unzip && \
    cd /usr/local && \
    curl -O http://mirrors.gigenet.com/apache/tomcat/tomcat-9/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.zip && \
    unzip apache-tomcat-$TOMCAT_VERSION.zip && \
    rm apache-tomcat-$TOMCAT_VERSION.zip && \
    mv apache-tomcat-$TOMCAT_VERSION tomcat$TOMCAT_VERSION && \
    chmod a+x tomcat$TOMCAT_VERSION/bin/*.sh && \
    rm -rf /var/lib/apt/lists/*
CMD /usr/local/tomcat${TOMCAT_VERSION}/bin/catalina.sh run
EXPOSE 8080
WORKDIR /mnt
