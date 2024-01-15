pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        script {
          dockerapp = docker.build("vitorgois/jenkins-talks:${env.BUILD_ID}", '-f ./Dockerfile .')
        }
      }
    }

    stage('Push') {
      steps {
        script {
          docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
            dockerapp.push("latest")
            dockerapp.push("${env.BUILD_ID}")
          }
        }
      }
    }

    stage('Run') {
      steps {
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
          docker.image("vitorgois/jenkins-talks:${env.BUILD_ID}").run("-p 3000:3000")
        }
      }
    }
  }
}