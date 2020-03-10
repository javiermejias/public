apiVersion: build.openshift.io/v1
kind: BuildConfig
metadata:
  name: curso-okd-public-docker
spec:
  output:
    to:
      kind: ImageStreamTag
      name: 'curso-okd-public-docker:latest'
  runPolicy: Serial
  source:
    git:
      ref: master
      uri: 'https://github.com/javiermejias/public.git'
    type: Git
  strategy:
    dockerStrategy:
    type: Docker
  triggers:
    - imageChange:
        lastTriggeredImageID: >-
          172.30.1.1:5000/openshift/python@sha256:d10c46b6db436357965a96716e9f5d230d9b1a58c6db1f0c4f43c1fb1994cd79
      type: ImageChange
    - type: ConfigChange
    - generic:
        secret: 81afecbaf0203f4c
      type: Generic
    - github:
        secret: abd8cf984d0ad9d5
      type: GitHub
