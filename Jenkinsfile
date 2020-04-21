node("master") {
    stage('Checkout') {
        checkout scm
    }
    stage("Build Docker Image") {
        sh '''docker build -t stmosher/python_rest_api:latest .'''
    }

    stage("Push to DockerHub") {
        docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
            sh '''docker push stmosher/python_rest_api:latest'''
        }
    }
}
