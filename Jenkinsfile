pipeline {

  agent any
  
  stages {

    stage('Checkout Source') {
      steps {
        git url:'https://github.com/andrewromanchukk/frontend-eschool-k8s.git', branch:'master'
      }
    }
    
      stage("Build image") {
              environment 
              {
                BUILDMODE = credentials('BUILDMODE')
              }
            
            steps {
                script {
                    myapp = docker.build("igneous-sum-312016/eschool_frontend:${BUILD_ID}", "--build-arg BUILDMODE=$BUILDMODE --no-cache .")
                }
            }
        }
    
      stage("Push image") {
            steps {
                script {
                    docker.withRegistry('https://eu.gcr.io/igneous-sum-312016/eschool_frontend', 'gcr:gcr_eschool') {
                            myapp.push("latest")
                            myapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }

    
  //   stage('Deploy App') {
  //     steps {
  //       script {
  //         kubernetesDeploy(configs: "hellowhale.yml", kubeconfigId: "mykubeconfig")
  //       }
  //     }
  //   }

  // }
  }
}