# Usage

```
docker run -d --rm \
 -e DISPLAY=$DISPLAY \
 -v /tmp/.X11-unix:/tmp/.X11-unix \
 -v <path-to-project>:/home/ubuntu/<project-name> \
 290992385038.dkr.ecr.eu-west-1.amazonaws.com/scala-ide
```
