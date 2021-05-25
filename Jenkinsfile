node {
    dockerfile {
      additionalBuildArgs "--build-arg BUILDMODE=${BUILDMODE}"
    }
    checkout scm

    docker.withRegistry('https://eu.gcr.io/igneous-sum-312016/uuu', 'gcr:gcr_eschool') {

        def customImage = docker.build("igneous-sum-312016/uuu:${env.BUILD_ID}")

        /* Push the container to the custom Registry */
        customImage.push()

                customImage.push('latest')
    }
}
