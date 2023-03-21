FROM jenkins/jenkins:lts

USER root

# Install Mercurial package
RUN apt-get update && \
    apt-get install -y mercurial sudo iputils-ping telnet && \
    rm -rf /var/lib/apt/lists/*

USER jenkins

# Add Mercurial to the classpath
ENV PATH="/usr/bin:${PATH}"

# Install the Mercurial plugin
RUN jenkins-plugin-cli --plugins mercurial