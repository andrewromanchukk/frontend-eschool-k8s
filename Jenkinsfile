node {
    checkout scm

    docker.withRegistry('https://eu.gcr.io/igneous-sum-312016/uuu', 'gcr:gcr_eschool') {

        def customImage = docker.build("igneous-sum-312016/uuu:${env.BUILD_ID}")

        /* Push the container to the custom Registry */
        customImage.push()
//                 customImage.push("${env.BUILD_NUMBER}")
                customImage.push('latest')
    }
}
// pipeline {
//     agent any
//     stages {
//         stage('Build image') {
//             steps{
//             app = docker.build(' https://eu.gcr.io/igneous-sum-312016/www')
            
//                     def customImage = docker.build("my-image:${env.BUILD_ID}")
//                     customImage.push()
//             }
//         }
//         stage('Push image') {
//             steps{
//             docker.withRegistry('https://eu.gcr.io', 'gcr:gcr_eschool') {
//                 customImage.push("${env.BUILD_NUMBER}")
//                 customImage.push('latest')
//             }
//         }
//     }
// }
// }