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
stage("Docker Push")
steps{
generated syntax script
sh "docker login -u bajod -p ${Dockerhub}
sh "docker push bajod/helloworld:${buildnumber}"
}
}
    stage('Trigger ManifestUpdate') {
                echo "triggering updatemanifestjob"
                build job: 'updatemanifest', parameters: [string(name: 'DOCKERTAG', value: env.BUILD_NUMBER)]
        }
}
