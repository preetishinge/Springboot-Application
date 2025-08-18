pipeline {
    agent any
    tools{
        maven 'maven'
    }
    environment {
        SONARQUBE_URL = 'http://13.41.205.164:9000/'
        SONARQUBE_TOKEN = credentials ('Sonarqube-cred')
    }
    stages {
        stage('Checkout'){
            steps{
                git branch: 'main', credentialsId: 'Git-cred', url: 'https://github.com/preetishinge/Springboot-sonarqube'
                sh 'ls -la'
            }
        }
        stage('Build'){
            steps{
                sh 'mvn clean install'
            }
        }
        stage('Package'){
            steps{
                sh 'mvn package'
            }
        }
        stage('SonarQube Analysis'){
            steps{
                sh '''
                mvn sonar:sonar \
                  -Dsonar.projectKey=simple-hello-Preeti \
                  -Dsonar.host.url=http://13.41.205.164:9000 \
                  -Dsonar.login=$SONARQUBE_TOKEN
                '''
            }
        }
         stage('Deploy'){
            steps{
                sh '''
                nohup java -jar target/simple-hello-Preeti-1.0.0.jar --server.port=9090 > app.log 2>&1 &
                '''
            }
         }    
    }
}
