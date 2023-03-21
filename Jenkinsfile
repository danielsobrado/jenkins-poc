pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git 'http://hg-server:8000/'
            }
        }

        stage('Compile Python File') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'python -m compileall -l .'
                }
            }
        }
    }

    post {
        failure {
            mail body: "There was an error in the pipeline. Please check the build logs.",
                 subject: "Jenkins Pipeline Error",
                 to: "you@example.com"
        }
    }
}
