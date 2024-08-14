<a href="https://hub.docker.com/r/mnapps/mjpeg-streamer/tags">
    <img alt="Docker Image Version" src="https://img.shields.io/docker/v/mnapps/mjpeg-streamer?sort=semver&arch=amd64&logo=docker&logoSize=auto" >
</a>
<a href="https://hub.docker.com/r/mnapps/mjpeg-streamer/tags">
    <img alt="Docker Pulls" src="https://img.shields.io/docker/pulls/mnapps/mjpeg-streamer?logo=docker&logoSize=auto">
</a>

This is a docker file that utilizes [mjpg-streamer](https://github.com/jacksonliam/mjpg-streamer)⁠ to stream a webcam through the local network. You can find the docker image pre-build for AMD64 adn ARM64 processors on [docker hub](https://hub.docker.com/r/mnapps/mjpeg-streamer/tags).

Proposed docker-compose file (I used this config with a PS3 eye camera):

    services:
      mjpg-streamer:
        restart: always
        image: mnapps/mjpeg-streamer
        devices:
          - /dev/video0:/dev/video0
        ports:
          - 8080:8080
        environment:
          - RES=640x480
          - INPUT_ARGS=-y



For more details on mjpg-streamer visit the [original repo](https://github.com/jacksonliam/mjpg-streamer), this is just a Dockerfile to use this tool through docker.