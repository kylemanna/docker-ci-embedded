# Continuous Integration Build Environment for Embedded ARM Devices

Includes the necessary tools to cross-compile code for ARM Cortex-M0/1/3/4 devices.

Anticipation is to use with *gitlab-ci-multi-runner* (and similar) continuous integration build environment.

## GitLab Crash Course

### Create a GitLab Runner Container

Run this on your build machine (i.e. your always on dev machine or cloud instance):

    docker run -d --name gitlab-runner --restart always \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v /srv/gitlab-runner/config:/etc/gitlab-runner \
      gitlab/gitlab-runner:alpine

### Register a Runner

Run this on the build machine to connect it to the GitLab CI server.  If you're running GitLab CE, update the URL as appropriate.

    docker exec -it gitlab-runner gitlab-runner register \
      --non-interactive \
      --url "https://ci.gitlab.com/" \
      --registration-token "REGISTRATION_TOKEN" \
      --description "embedded" \
      --executor "docker" \
      --docker-image kylemanna/ci-embedded:latest

This will create a runner on GitLab with the specified docker image.

## Reference

* [GitLab: Using Docker Images](http://doc.gitlab.com/ci/docker/using_docker_images.html)
