# Jenkins PoC
This is a repository for experimenting with Jenkins. It currently contains the following experiments:

1. On commit, compile the code and send email alerts if there are any errors.

## Jenkins with Mercurial Docker Image

The Dockerfile installs the Mercurial package, adds Mercurial to the Jenkins classpath, and installs the Mercurial plugin.

### Usage
1. Clone or download the repository containing the Dockerfile and related files for Jenkins.
2. Navigate to the directory containing the Dockerfile.
3. Build the Docker image using the following command:
   
```
docker build -t my-mercurial-image .
```

4. Run the Docker container using the following command:
```
docker run -d -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home my-mercurial-image
```

This will start the Jenkins container and expose port 8080 for web access and port 50000 for remote access. It will also mount the "jenkins_home" directory inside the container to the host's file system to store the Jenkins configuration data.

Open a web browser and navigate to http://localhost:8080/jenkins to access the Jenkins web interface.

Follow the on-screen instructions to complete the Jenkins setup process.

### Notes
If you need to customize the Jenkins installation or add additional packages, you can modify the Dockerfile before building the image.
If you want to persist the Jenkins data across container restarts, you can use a Docker volume or a bind mount to store the "jenkins_home" directory on the host machine.
If you want to remove the Jenkins container, use the following command:
```
docker stop my-mercurial-image
docker rm my-mercurial-image
```

## hg-server Docker Image

This Docker image provides a simple Mercurial server that serves repositories over HTTP. It includes the `hg-server.sh` script that initializes the repository, starts the Mercurial server, and keeps the container running.

```
docker run -p 8000:8000 -v hg_repos:/var/hg/repos hg-server
```

This will start the container and map port 8000 on the host machine to port 8000 in the container. The `hg_repos` volume is mounted to the `/var/hg/repos` directory in the container, which is where the Mercurial repositories are stored.

### Additional Commands
This Docker image includes the following additional commands:

* `ping`: Check network connectivity to another host
* `telnet`: Connect to a remote host using Telnet protocol
* `sudo`: Run a command with elevated privileges
  
These commands can be useful for troubleshooting network and system issues.

### Building the Docker Image
To build the Docker image, you can use the following command:

```
docker build -t my-mercurial-image .
```

This will build the Docker image and tag it as `hg-server`.

## On Commit compile and send email alerts if there are errors
### Prerequisites
* Docker Compose to start Jenkins a mercurial server and a local email server
### Usage
1. Build the Docker image:
```
docker build -t my-jenkins-image .
```
2. Start the containers:
```
docker-compose up -d
```
3. Configure Jenkins:

* Go to http://localhost:8080/jenkins in your web browser
* Follow the Jenkins setup wizard
* Install the Mercurial plugin
* Create a new pipeline job
* Copy the contents of Jenkinsfile into the pipeline script
* Commit changes to the local Mercurial server to trigger the pipeline

## Notes
* The `Jenkinsfile` contains a pipeline that checks out code from the Mercurial server, installs dependencies, lints the code, and sends an email notification if there are any linting errors.
* The pipeline assumes that the Mercurial server is running on `localhost:8888` and that the email server is running on `localhost:1025`.
* The docker-compose.yml file starts three containers: one for Jenkins, one for a local email server (MailHog) and one to serve a mercurial repo.