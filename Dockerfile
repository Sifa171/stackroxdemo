
    FROM registry.redhat.io/jboss-webserver-5/webserver55-openjdk8-tomcat9-openshift-rhel8
    USER root
    RUN yum update -y && yum clean all && [ ! -d /var/cache/yum ] || rm -rf /var/cache/yum
    # Define the user
    USER 185
    # Define the working directory
    WORKDIR /home/jboss
    # Define run cmd
    CMD ["/opt/jws-5.5/tomcat/bin/launch.sh"]
