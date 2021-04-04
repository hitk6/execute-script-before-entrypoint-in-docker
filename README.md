# Mount scripts to docker containers and execute them before Entrypoint command

## 1 Method
In host system copying the configuration file multiple times and
editing the conf file using "sed" than mounting the file to container while launching

## 2 Method
1 create a new image using existing image for that we make a Dockerfile
  here make a new-file to run all files in a /entrypoint-scripts/ dir before starting the services
  and pass the new-file in entrypoint
  the new-file should be executable already inside the conatiner

2 and mount the configuration scripts in the /path/scripts/ dir in the container while launching the container.

