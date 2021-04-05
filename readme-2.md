# Explaining Entrypoint

Docker entrypoint is a Dockerfile directive or instruction that is used to specify the executable 
which should run when a container is started from a Docker image


# We have a stateful app every container requires a different configuration file

# copy httpd.conf file to local sys
docker run --rm httpd cat /usr/local/apache2/conf/httpd.conf > my-httpd.conf

## Requirement Stateful system require different configuration file for each conatiner.

## Method - 1 
## In host system copying the configuration file multiple times and
## editing the conf file using "sed" than mounting the file to container while launching

for i in $(seq 1 $1)
do
   echo conatiner-no-$i
   cp  /home/ec2-user/my-httpd.conf /home/ec2-user/my-httpd-$i.conf
   sed -i "s/Listen 80/Listen 100$i/g" my-httpd-$i.conf
   docker run -dit --name web-$i -p 100$i:100$i -v  /home/ec2-user/my-httpd-$i.conf:/usr/local/apache2/conf/httpd.conf httpd
done

rm -f my-httpd-*.conf

# -p host-sys-port:container-port


Method 2 
1 create a new image using existing image
  here make a file to run all files in a /path/scripts before starting the services
  and pass the full file path in entrypoint
  the file should be +x
2 and mount the configuration scripts in the /path/scripts/ dir in the container while launching the container.

cd 2-method
docker build -t httpd-custom .
./start-containers-on-host.sh <no-of-conatiners>



# Aliases
alias dc='docker-compose'
alias ddel='docker rm -f $(docker ps -aq)'
alias cache='echo 3 > /proc/sys/vm/drop_caches'


# cmd to change listen port from 80 to 1000 in httpd.conf file
sed -i 's/Listen 80/Listen 1000/g' /usr/local/apache2/conf/httpd.conf
