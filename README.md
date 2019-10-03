# Usage

```
docker run -d --rm \
 -e DISPLAY=$DISPLAY \
 -v /tmp/.X11-unix:/tmp/.X11-unix \
 -v ~/.gitconfig:/home/ubuntu/.gitconfig:ro \
 -v ~/.ssh:/home/ubuntu/.ssh:ro \
 -v <path-to-project>:/home/ubuntu/<project-name> \
 vivivanilla/intellij-scala-sbt:latest
```
