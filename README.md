# Usage

```
docker run -d --rm \
 -e DISPLAY=$DISPLAY \
 -v /tmp/.X11-unix:/tmp/.X11-unix \
 -v <path-to-project>:/home/ubuntu/<project-name> \
 vivivanilla/intellij-scala-sbt:latest
```
