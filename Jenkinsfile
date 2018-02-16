node("master") {
    stage('Checkout') {
        checkout scm
    }
    stage("Build Docker Image") {
        sh '''docker build -t devmandy/python_rest_api:latest .'''
    }

    stage("Push to DockerHub") {
        docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
            sh '''docker push devmandy/python_rest_api:latest'''
        }
    }
}
