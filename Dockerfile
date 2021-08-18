
    FROM image-registry.openshift-image-registry.svc:5000/openshift/jboss-webserver54-openjdk11-tomcat9-openshift-ubi8
    USER root
    #RUN yum update --allowerasing -y && yum clean all && [ ! -d /var/cache/yum ] || rm -rf /var/cache/yum
    # Define the user
    USER 185
    # Define the working directory
    WORKDIR /home/jboss
    # Define run cmd
    CMD ["/opt/jws-5.5/tomcat/bin/launch.sh"]
