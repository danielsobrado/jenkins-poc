# Jenkins PoC
This is a repository for experimenting with Jenkins. It currently contains the following experiments:

1. On commit, compile the code and send email alerts if there are any errors.

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