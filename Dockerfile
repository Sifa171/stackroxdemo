
# This is a Dockerfile for the jboss-webserver-5/webserver55-openjdk8-tomcat9-rhel8-openshift:1.0 image.



## START target image jboss-webserver-5/webserver55-openjdk8-tomcat9-rhel8-openshift:1.0
## \
    FROM jboss-webserver-5/webserver55-openjdk8-tomcat9-rhel8:5.5.0

    USER root

###### START module 'jboss.container.maven.35.bash:3.5'
###### \
        # Copy 'jboss.container.maven.35.bash' module content
        COPY modules/jboss.container.maven.35.bash /tmp/scripts/jboss.container.maven.35.bash
        # Switch to 'root' user to install 'jboss.container.maven.35.bash' module defined packages
        USER root
        # Install packages defined in the 'jboss.container.maven.35.bash' module
        RUN yum --setopt=tsflags=nodocs install -y maven \
            && rpm -q maven
        # Set 'jboss.container.maven.35.bash' module defined environment variables
        ENV \
            JBOSS_CONTAINER_MAVEN_35_MODULE="/opt/jboss/container/maven/35/" \
            MAVEN_VERSION="3.5" 
        # Set 'jboss.container.maven.35.bash' module defined labels
        LABEL \
            io.fabric8.s2i.version.maven="3.5" 
        # Custom scripts from 'jboss.container.maven.35.bash' module
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/jboss.container.maven.35.bash/configure.sh" ]
###### /
###### END module 'jboss.container.maven.35.bash:3.5'

###### START module 'jboss.container.java.jvm.api:1.0'
###### \
###### /
###### END module 'jboss.container.java.jvm.api:1.0'

###### START module 'jboss.container.proxy.api:2.0'
###### \
###### /
###### END module 'jboss.container.proxy.api:2.0'

###### START module 'jboss.container.java.proxy.bash:2.0'
###### \
        # Copy 'jboss.container.java.proxy.bash' module content
        COPY modules/jboss.container.java.proxy.bash /tmp/scripts/jboss.container.java.proxy.bash
        # Set 'jboss.container.java.proxy.bash' module defined environment variables
        ENV \
            JBOSS_CONTAINER_JAVA_PROXY_MODULE="/opt/jboss/container/java/proxy" 
        # Custom scripts from 'jboss.container.java.proxy.bash' module
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/jboss.container.java.proxy.bash/configure.sh" ]
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/jboss.container.java.proxy.bash/backward_compatibility.sh" ]
###### /
###### END module 'jboss.container.java.proxy.bash:2.0'

###### START module 'jboss.container.java.jvm.bash:1.0'
###### \
        # Copy 'jboss.container.java.jvm.bash' module content
        COPY modules/jboss.container.java.jvm.bash /tmp/scripts/jboss.container.java.jvm.bash
        # Set 'jboss.container.java.jvm.bash' module defined environment variables
        ENV \
            JBOSS_CONTAINER_JAVA_JVM_MODULE="/opt/jboss/container/java/jvm" 
        # Custom scripts from 'jboss.container.java.jvm.bash' module
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/jboss.container.java.jvm.bash/configure.sh" ]
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/jboss.container.java.jvm.bash/backward_compatibility.sh" ]
###### /
###### END module 'jboss.container.java.jvm.bash:1.0'

###### START module 'dynamic-resources:1.0'
###### \
        # Copy 'dynamic-resources' module content
        COPY modules/dynamic-resources /tmp/scripts/dynamic-resources
        # Custom scripts from 'dynamic-resources' module
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/dynamic-resources/install.sh" ]
###### /
###### END module 'dynamic-resources:1.0'

###### START module 'jboss.container.maven.api:1.0'
###### \
###### /
###### END module 'jboss.container.maven.api:1.0'

###### START module 'jboss.container.util.logging.bash:1.0'
###### \
        # Copy 'jboss.container.util.logging.bash' module content
        COPY modules/jboss.container.util.logging.bash /tmp/scripts/jboss.container.util.logging.bash
        # Set 'jboss.container.util.logging.bash' module defined environment variables
        ENV \
            JBOSS_CONTAINER_UTIL_LOGGING_MODULE="/opt/jboss/container/util/logging/" 
        # Custom scripts from 'jboss.container.util.logging.bash' module
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/jboss.container.util.logging.bash/configure.sh" ]
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/jboss.container.util.logging.bash/backward_compatibility.sh" ]
###### /
###### END module 'jboss.container.util.logging.bash:1.0'

###### START module 'jboss.container.maven.default.bash:1.0'
###### \
        # Copy 'jboss.container.maven.default.bash' module content
        COPY modules/jboss.container.maven.default.bash /tmp/scripts/jboss.container.maven.default.bash
        # Set 'jboss.container.maven.default.bash' module defined environment variables
        ENV \
            JBOSS_CONTAINER_MAVEN_DEFAULT_MODULE="/opt/jboss/container/maven/default/" 
        # Custom scripts from 'jboss.container.maven.default.bash' module
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/jboss.container.maven.default.bash/configure.sh" ]
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/jboss.container.maven.default.bash/backward_compatibility.sh" ]
###### /
###### END module 'jboss.container.maven.default.bash:1.0'

###### START module 's2i-common:1.0'
###### \
###### /
###### END module 's2i-common:1.0'

###### START module 'jboss.container.s2i.core.api:1.0'
###### \
        # Set 'jboss.container.s2i.core.api' module defined environment variables
        ENV \
            S2I_SOURCE_DEPLOYMENTS_FILTER="*" 
        # Set 'jboss.container.s2i.core.api' module defined labels
        LABEL \
            io.openshift.s2i.destination="/tmp"  \
            io.openshift.s2i.scripts-url="image:///usr/local/s2i"  \
            org.jboss.container.deployments-dir="/deployments" 
###### /
###### END module 'jboss.container.s2i.core.api:1.0'

###### START module 'jboss.container.maven.s2i.api:1.0'
###### \
###### /
###### END module 'jboss.container.maven.s2i.api:1.0'

###### START module 'jboss.container.s2i.core.bash:1.0'
###### \
        # Copy 'jboss.container.s2i.core.bash' module content
        COPY modules/jboss.container.s2i.core.bash /tmp/scripts/jboss.container.s2i.core.bash
        # Set 'jboss.container.s2i.core.bash' module defined environment variables
        ENV \
            JBOSS_CONTAINER_S2I_CORE_MODULE="/opt/jboss/container/s2i/core/" 
        # Custom scripts from 'jboss.container.s2i.core.bash' module
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/jboss.container.s2i.core.bash/configure.sh" ]
###### /
###### END module 'jboss.container.s2i.core.bash:1.0'

###### START module 'jboss.container.maven.s2i.bash:1.0'
###### \
        # Copy 'jboss.container.maven.s2i.bash' module content
        COPY modules/jboss.container.maven.s2i.bash /tmp/scripts/jboss.container.maven.s2i.bash
        # Set 'jboss.container.maven.s2i.bash' module defined environment variables
        ENV \
            JBOSS_CONTAINER_MAVEN_S2I_MODULE="/opt/jboss/container/maven/s2i" 
        # Custom scripts from 'jboss.container.maven.s2i.bash' module
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/jboss.container.maven.s2i.bash/configure.sh" ]
###### /
###### END module 'jboss.container.maven.s2i.bash:1.0'

###### START module 'jboss.container.jws.s2i.bash:1.0'
###### \
        # Copy 'jboss.container.jws.s2i.bash' module content
        COPY modules/jboss.container.jws.s2i.bash /tmp/scripts/jboss.container.jws.s2i.bash
        # Set 'jboss.container.jws.s2i.bash' module defined environment variables
        ENV \
            JBOSS_CONTAINER_JWS_S2I_MODULE="/opt/jboss/container/jws/s2i" \
            S2I_SOURCE_DEPLOYMENTS_FILTER="*.war" 
        # Custom scripts from 'jboss.container.jws.s2i.bash' module
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/jboss.container.jws.s2i.bash/configure.sh" ]
###### /
###### END module 'jboss.container.jws.s2i.bash:1.0'

###### START module 'os-jws-s2i:2.0'
###### \
###### /
###### END module 'os-jws-s2i:2.0'

###### START module 'jws8-conffiles:1.0'
###### \
        # Copy 'jws8-conffiles' module general artifacts to '/tmp/artifacts/' destination
        COPY \
            artifacts/tomcat-8-valves-1.0.3.Final-redhat-1.jar \
            /tmp/artifacts/
        # Copy 'jws8-conffiles' module content
        COPY modules/jws8-conffiles /tmp/scripts/jws8-conffiles
        # Custom scripts from 'jws8-conffiles' module
        USER 185
        RUN [ "sh", "-x", "/tmp/scripts/jws8-conffiles/run" ]
###### /
###### END module 'jws8-conffiles:1.0'

###### START module 'rm-manager:1.0'
###### \
        # Copy 'rm-manager' module content
        COPY modules/rm-manager /tmp/scripts/rm-manager
        # Custom scripts from 'rm-manager' module
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/rm-manager/run.sh" ]
###### /
###### END module 'rm-manager:1.0'

###### START module 'os-jws-deployments:2.0'
###### \
        # Copy 'os-jws-deployments' module content
        COPY modules/os-jws-deployments /tmp/scripts/os-jws-deployments
        # Custom scripts from 'os-jws-deployments' module
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/os-jws-deployments/run" ]
        USER 185
        RUN [ "sh", "-x", "/tmp/scripts/os-jws-deployments/run_as_jboss" ]
###### /
###### END module 'os-jws-deployments:2.0'

###### START module 'jboss.container.jolokia.api:1.0'
###### \
        # Set 'jboss.container.jolokia.api' module defined environment variables
        ENV \
            AB_JOLOKIA_AUTH_OPENSHIFT="true" \
            AB_JOLOKIA_HTTPS="true" \
            AB_JOLOKIA_PASSWORD_RANDOM="true" 
###### /
###### END module 'jboss.container.jolokia.api:1.0'

###### START module 'jboss.container.jolokia.bash:1.0'
###### \
        # Copy 'jboss.container.jolokia.bash' module general artifacts to '/tmp/artifacts/' destination
        COPY \
            artifacts/jolokia-jvm-1.6.2.redhat-00002-agent.jar \
            /tmp/artifacts/
        # Copy 'jboss.container.jolokia.bash' module content
        COPY modules/jboss.container.jolokia.bash /tmp/scripts/jboss.container.jolokia.bash
        # Set 'jboss.container.jolokia.bash' module defined environment variables
        ENV \
            AB_JOLOKIA_AUTH_OPENSHIFT="true" \
            AB_JOLOKIA_HTTPS="true" \
            AB_JOLOKIA_PASSWORD_RANDOM="true" \
            JBOSS_CONTAINER_JOLOKIA_MODULE="/opt/jboss/container/jolokia" \
            JOLOKIA_VERSION="1.6.2" 
        # Set 'jboss.container.jolokia.bash' module defined labels
        LABEL \
            io.fabric8.s2i.version.jolokia="1.6.2-redhat-00002" 
        # Exposed ports in 'jboss.container.jolokia.bash' module
        EXPOSE 8778
        # Custom scripts from 'jboss.container.jolokia.bash' module
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/jboss.container.jolokia.bash/configure.sh" ]
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/jboss.container.jolokia.bash/backward_compatibility.sh" ]
###### /
###### END module 'jboss.container.jolokia.bash:1.0'

###### START module 'os-jws-jolokia:2.0'
###### \
        # Copy 'os-jws-jolokia' module content
        COPY modules/os-jws-jolokia /tmp/scripts/os-jws-jolokia
        # Custom scripts from 'os-jws-jolokia' module
        USER 185
        RUN [ "sh", "-x", "/tmp/scripts/os-jws-jolokia/run" ]
###### /
###### END module 'os-jws-jolokia:2.0'

###### START module 'os-jws-launch:2.0'
###### \
        # Copy 'os-jws-launch' module content
        COPY modules/os-jws-launch /tmp/scripts/os-jws-launch
        # Custom scripts from 'os-jws-launch' module
        USER 185
        RUN [ "sh", "-x", "/tmp/scripts/os-jws-launch/run" ]
###### /
###### END module 'os-jws-launch:2.0'

###### START module 'os-jws-https:2.0'
###### \
        # Copy 'os-jws-https' module content
        COPY modules/os-jws-https /tmp/scripts/os-jws-https
        # Custom scripts from 'os-jws-https' module
        USER 185
        RUN [ "sh", "-x", "/tmp/scripts/os-jws-https/run" ]
###### /
###### END module 'os-jws-https:2.0'

###### START module 'jws-secure-mgmt-console:1.0'
###### \
        # Copy 'jws-secure-mgmt-console' module content
        COPY modules/jws-secure-mgmt-console /tmp/scripts/jws-secure-mgmt-console
        # Custom scripts from 'jws-secure-mgmt-console' module
        USER 185
        RUN [ "sh", "-x", "/tmp/scripts/jws-secure-mgmt-console/run" ]
###### /
###### END module 'jws-secure-mgmt-console:1.0'

###### START module 'os-jws-rm-root:2.0'
###### \
        # Copy 'os-jws-rm-root' module content
        COPY modules/os-jws-rm-root /tmp/scripts/os-jws-rm-root
        # Custom scripts from 'os-jws-rm-root' module
        USER 185
        RUN [ "sh", "-x", "/tmp/scripts/os-jws-rm-root/run" ]
###### /
###### END module 'os-jws-rm-root:2.0'

###### START module 'os-jws-rm-defaults:2.0'
###### \
        # Copy 'os-jws-rm-defaults' module content
        COPY modules/os-jws-rm-defaults /tmp/scripts/os-jws-rm-defaults
        # Custom scripts from 'os-jws-rm-defaults' module
        USER 185
        RUN [ "sh", "-x", "/tmp/scripts/os-jws-rm-defaults/run" ]
###### /
###### END module 'os-jws-rm-defaults:2.0'

###### START module 'os-jws-chmod:2.0'
###### \
        # Copy 'os-jws-chmod' module content
        COPY modules/os-jws-chmod /tmp/scripts/os-jws-chmod
        # Custom scripts from 'os-jws-chmod' module
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/os-jws-chmod/run" ]
###### /
###### END module 'os-jws-chmod:2.0'

###### START module 'jboss.container.user:1.0'
###### \
        # Copy 'jboss.container.user' module content
        COPY modules/jboss.container.user /tmp/scripts/jboss.container.user
        # Switch to 'root' user to install 'jboss.container.user' module defined packages
        USER root
        # Install packages defined in the 'jboss.container.user' module
        RUN yum --setopt=tsflags=nodocs install -y unzip tar rsync shadow-utils \
            && rpm -q unzip tar rsync shadow-utils
        # Set 'jboss.container.user' module defined environment variables
        ENV \
            HOME="/home/jboss" 
        # Custom scripts from 'jboss.container.user' module
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/jboss.container.user/configure.sh" ]
###### /
###### END module 'jboss.container.user:1.0'

###### START module 'openshift-passwd:1.0'
###### \
###### /
###### END module 'openshift-passwd:1.0'

###### START module 'os-eap-python:3.6'
###### \
        # Copy 'os-eap-python' module content
        COPY modules/os-eap-python /tmp/scripts/os-eap-python
        # Switch to 'root' user to install 'os-eap-python' module defined packages
        USER root
        # Install packages defined in the 'os-eap-python' module
        RUN yum --setopt=tsflags=nodocs install -y python36 \
            && rpm -q python36
        # Custom scripts from 'os-eap-python' module
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/os-eap-python/configure.sh" ]
###### /
###### END module 'os-eap-python:3.6'

###### START module 'java-alternatives:1.0'
###### \
        # Copy 'java-alternatives' module content
        COPY modules/java-alternatives /tmp/scripts/java-alternatives
        # Custom scripts from 'java-alternatives' module
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/java-alternatives/run.sh" ]
###### /
###### END module 'java-alternatives:1.0'

###### START module 'jws5-logging:1.0'
###### \
        # Copy 'jws5-logging' module content
        COPY modules/jws5-logging /tmp/scripts/jws5-logging
        # Custom scripts from 'jws5-logging' module
        USER 185
        RUN [ "sh", "-x", "/tmp/scripts/jws5-logging/run" ]
###### /
###### END module 'jws5-logging:1.0'

###### START image 'jboss-webserver-5/webserver55-openjdk8-tomcat9-rhel8-openshift:1.0'
###### \
        # Switch to 'root' user to install 'jboss-webserver-5/webserver55-openjdk8-tomcat9-rhel8-openshift' image defined packages
        USER root
        # Install packages defined in the 'jboss-webserver-5/webserver55-openjdk8-tomcat9-rhel8-openshift' image
        RUN yum --setopt=tsflags=nodocs install -y python3-pyyaml \
            && rpm -q python3-pyyaml
        # Set 'jboss-webserver-5/webserver55-openjdk8-tomcat9-rhel8-openshift' image defined environment variables
        ENV \
            JBOSS_IMAGE_NAME="jboss-webserver-5/webserver55-openjdk8-tomcat9-rhel8-openshift" \
            JBOSS_IMAGE_VERSION="1.0" \
            STI_BUILDER="jee" 
        # Set 'jboss-webserver-5/webserver55-openjdk8-tomcat9-rhel8-openshift' image defined labels
        LABEL \
            com.redhat.component="jboss-webserver-5-webserver55-openjdk8-tomcat9-rhel8-openshift-container"  \
            description="Red Hat JBoss Web Server 5.5 - Tomcat 9 OpenShift container image with OpenJDK8 on UBI8"  \
            io.cekit.version="3.9"  \
            io.k8s.description="Platform for building and running web applications on JBoss Web Server 5.5 with OpenJDK8 - Tomcat v9"  \
            io.k8s.display-name="JBoss Web Server 5.5 OpenJDK8"  \
            io.openshift.expose-services="8080:http"  \
            io.openshift.s2i.scripts-url="image:///usr/local/s2i"  \
            io.openshift.tags="builder,java,tomcat9"  \
            maintainer="szappis@redhat.com"  \
            name="jboss-webserver-5/webserver55-openjdk8-tomcat9-rhel8-openshift"  \
            summary="Red Hat JBoss Web Server 5.5 - Tomcat 9 OpenShift container image with OpenJDK8 on UBI8"  \
            version="1.0" 
        # Exposed ports in 'jboss-webserver-5/webserver55-openjdk8-tomcat9-rhel8-openshift' image
        EXPOSE 8443
###### /
###### END image 'jboss-webserver-5/webserver55-openjdk8-tomcat9-rhel8-openshift:1.0'


    # Switch to 'root' user and remove artifacts and modules
    USER root
    RUN [ ! -d /tmp/scripts ] || rm -rf /tmp/scripts
    RUN [ ! -d /tmp/artifacts ] || rm -rf /tmp/artifacts
    # Clear package manager metadata
    RUN yum update && yum clean all && [ ! -d /var/cache/yum ] || rm -rf /var/cache/yum

    # Define the user
    USER 185
    # Define the working directory
    WORKDIR /home/jboss
    # Define run cmd
    CMD ["/opt/jws-5.5/tomcat/bin/launch.sh"]
## /
## END target image
