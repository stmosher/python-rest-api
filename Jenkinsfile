podTemplate(name: 'super-pod', label: 'build-pod', containers: [
containerTemplate(name: 'python', image: 'python:3.7-alpine'),
containerTemplate(name: 'docker', image: 'docker:stable')],
volumes: [
    hostPathVolume(mountPath: '/var/run/docker.sock',
    hostPath: '/var/run/docker.sock'),])

node("super-pod") {
    stage('Checkout') {
        checkout scm
    }
    stage("Build Docker Image") {
        container('python'){
        sh '''docker build -t stmosher/python_rest_api:latest .'''
    }}

    stage("Push to DockerHub") {
        container('docker'){
        docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
            sh '''docker build -t stmosher/python_rest_api:latest .'''
            sh '''docker push stmosher/python_rest_api:latest'''
        }}
    }
}
