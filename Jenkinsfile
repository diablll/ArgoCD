pipeline{
def buildnumber=BUILD_NUMBER
tools{
maven "maven3.8.5"
}
stages{
    stage("Git clone") {
        
        checkout scm
}
stage("Test+Build")
steps{
sh "echo running UnitTesting"
sh "mvn clean package"
}
stage("Build Docker Image")
steps{
sh "docker build -t bajod/helloworld:${buildnumber}"
}

    stage('Push image') {
        
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
            docker.push("${env.BUILD_NUMBER}")
        }
    }
    stage('Trigger ManifestUpdate') {
                echo "triggering updatemanifestjob"
                build job: 'updatemanifest', parameters: [string(name: 'DOCKERTAG', value: env.BUILD_NUMBER)]
        }
}
