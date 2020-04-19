pipeline {
    agent any

    parameters {
        string(name: 'tomcat_dev', defaultValue: '3.135.239.133', description: 'Staging Server')
        string(name: 'tomcat_prod', defaultValue: '3.15.234.231', description: 'Production Server')
    }

    triggers {
        pollSCM('* * * * *')
    }
    }
stages{
        stage('Build'){
            steps {
                sh 'mvn clean package'
            }
            post {
                success {
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '/var/jenkins_home/workspace/package_pipeline/webapp/target/*.war'
                }
            }
        }

        stage ('Deployments'){
            parallel{
                stage ('Deploy to Staging'){
                    steps {
                        sh "scp -i /home/jenkins/tomcat-demo.pem /var/jenkins_home/workspace/package_pipeline/webapp/target/*.war ec2-user@${params.tomcat_dev}:/var/lib/tomcat7/webapps"
                    }
                }

                stage ("Deploy to Production"){
                    steps {
                        sh "scp -i /home/jenkins/tomcat-demo.pem /var/jenkins_home/workspace/package_pipeline/webapp/target/*.war ec2-user@${params.tomcat_prod}:/var/lib/tomcat7/webapps"
                    }
                }
            }
        }
    }
}
}