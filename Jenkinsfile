pipeline {
    agent any
    tools {
        maven 'localMaven'
    }
stages{
        stage('Build'){
            steps {
                sh 'mvn clean package'
                sh "/usr/local/Cellar/docker build . -t tomcatwebapp:${env.NUILD_ID}"
            }
        }
    }
}