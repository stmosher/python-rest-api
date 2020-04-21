podTemplate(
  label: 'test123',
  yaml: """
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: kubectl
    image: vfarcic/kubectl
    command: ["cat"]
    tty: true
"""
) {
  node(label) {
    node("docker") {
    stage("func-test") {
        container("kubectl") {
          sh """kubectl get pods"""
        }
    }
  }
}
}