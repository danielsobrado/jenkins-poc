FROM jenkins/jenkins:lts

USER root

# Install Mercurial package
RUN apt-get update && \
    apt-get install -y mercurial sudo iputils-ping telnet && \
    rm -rf /var/lib/apt/lists/*

# Create workspace directory and set permissions
RUN mkdir /home/jenkins_workspace && \
    chown jenkins:jenkins /home/jenkins_workspace

USER jenkins

# Add Mercurial to the classpath
ENV PATH="/usr/bin/hg:${PATH}"

# Install the Mercurial plugin
RUN jenkins-plugin-cli --plugins mercurial

# Copy the Jenkinsfile to the Jenkins home directory
COPY Jenkinsfile /var/jenkins_home/Jenkinsfile