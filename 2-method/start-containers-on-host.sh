## Requirement 
## Stateful system require unique configuration file for each conatiner.
## So, a method to  mount the script in conatiner (to change the configuration file) 
## and running it before Entrypoint
## 
## Method - 2 

chmod +x mount-to-conatiners.sh 

# $1 is input , no of conatiners to launch
for i in $(seq 1 $1)
do
   echo loop-no-$i
   docker run -dit --name web-$i -p 100$i:1001 -p 80 -v  /home/ec2-user/execute-script-before-entrypoint-in-docker/2-method/mount-to-conatiners.sh:/entrypoint-scripts/00-script.sh  httpd-custom 
done

# -p host-sys-port:container-port
