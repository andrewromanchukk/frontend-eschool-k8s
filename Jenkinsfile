// node {
//     triggers {
//     GitHubPush()
//   }
//     checkout scm

//     docker.withRegistry('https://eu.gcr.io/igneous-sum-312016/uuu', 'gcr:gcr_eschool') {

//         def customImage = docker.build("igneous-sum-312016/uuu:${env.BUILD_ID}")

//         /* Push the container to the custom Registry */
//         customImage.push()
// //                 customImage.push("${env.BUILD_NUMBER}")
//                 customImage.push('latest')
//     }
// }
pipeline {
    agent any
    stages {
        stage('Build image') {
            app = docker.build(' https://eu.gcr.io/igneous-sum-312016/www')
            steps {
                    def customImage = docker.build("my-image:${env.BUILD_ID}")
                    customImage.push()
            }
        }
        stage('Push image') {
            docker.withRegistry('https://eu.gcr.io', 'gcr:gcr_eschool') {
                app.push("${env.BUILD_NUMBER}")
                app.push('latest')
            }
        }
    }
}