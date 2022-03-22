node{
    def buildnumber = BUILD_NUMBER
    def mavenHome = tool name: 'maven3.8.5'
    stage('SCM Clone') {
        git credentialsID: 'github', url: 'https://github.com/diablll/ArgoCD.git'
    }
    stage('MavenBuild') {
        sh "${mavenHome}/bin/mvn clean package"
    }
    stage('BuildDockerImage'){
        sh "docker build -t bajod/spring:${buildnumber} ."
    }
 stage("ExecuteSonarQubeReport")
 {
 //sh "${mavenHome}/bin/mvn sonar:sonar"
 }
 
 stage("UploadArtifactsintoNexus")
 {
 //sh "${mavenHome}/bin/mvn deploy"
 }
 stage('EmailNotification')
/* {
 mail bcc: 'ganabajo24@gmail.com', body: '''Build is over
Thanks,
 Landmark Technologies,
 +14372152483.''', cc: 'ganabajo24@gmail.com', from: '', replyTo: '', subject: 'Build is over!!', to: 'ganabajo24@gmail.com'
    }
    */
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

