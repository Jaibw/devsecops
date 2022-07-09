pipeline {
    agent any
    stages {
        stage('Build') {
            steps {                
                git 'https://github.com/Jaibw/FrozenYogurtShop.git'
                sh "docker build -t website:${env.BUILD_TAG} ."
            }
        }
        stage('scan') {
            steps {
                sh "trivy image website:${env.BUILD_TAG}"
            }
        }
         
      
    }
}
