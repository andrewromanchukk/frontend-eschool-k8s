node {
    checkout scm

    docker.withRegistry('https://eu.gcr.io/igneous-sum-312016/uuu', 'docker_build') {

        def customImage = docker.build("my-image:${env.BUILD_ID}")

        /* Push the container to the custom Registry */
        customImage.push()
    }
}
