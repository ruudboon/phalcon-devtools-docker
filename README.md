# phalcon-devtools
Basic docker container with the latest phalcon devtools to use cmd line

## Create a new project
Mount your working dir and initaliase a new project like this

$ docker run -v ${PWD}:/project -it --rm ruudboon/phalcon-devtools project


## Terminal approach 
Starts a container and mounts your working dir and enter a sh console

$ docker run -v ${PWD}:/project -it --entrypoint=sh --rm ruudboon/phalcon-devtools