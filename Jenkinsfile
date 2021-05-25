// node {
//     dockerfile {
//       additionalBuildArgs "--build-arg BUILDMODE=${BUILDMODE}"
//     }
//     checkout scm

//     docker.withRegistry('https://eu.gcr.io/igneous-sum-312016/uuu', 'gcr:gcr_eschool') {

//         def customImage = docker.build("igneous-sum-312016/uuu:${env.BUILD_ID}")

//         /* Push the container to the custom Registry */
//         customImage.push()

//                 customImage.push('latest')
//     }
// }
pipeline {
  environment {
    registry = 'https://eu.gcr.io/igneous-sum-312016/uuu'
    registryCredential = 'gcr_eschool'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/andrewromanchukk/frontend-eschool-k8s.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( registry, registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
}
