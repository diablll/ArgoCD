node{
    def buildnumber = BUILD_NUMBER
    def mavenHome = tool name: 'maven3.8.5'
    stage('SCM Clone') {
    url: 'https://github.com/diablll/ArgoCD.git'
    }
    stage('MavenBuild') {
        sh "${mavenHome}/bin/mvn clean package"
    }
stage('CodeQualityReport') {
sh "echo running CodeQuality analysis"
//sh "mvn sonar:sonar"
}
stage('UploadArtifacts') {
sh "echo uploading artifacts in nexus"
//sh "mvn deploy"
 }
    stage('BuildDockerImage'){
        sh "docker build -t bajod/spring:${buildnumber} ."
    }
    stage("Docker Push"){
withCredentials([string(credentialsId: 'DockerHubCredentials', variable: 'DockerHubCredentials')]) {
 sh "docker login -u bajod -p ${DockerHubCredentials}"
}

sh "docker push bajod/spring:${buildnumber}"
}
   stage('Trigger ManifestUpdate') {
                echo "triggering updatemanifestjob"
                build job: "updatemanifest", parameters: [string(name: 'DOCKERTAG', value: env.BUILD_NUMBER)]
   }
}

