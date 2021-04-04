## Requirement Stateful system require different configuration file for each conatiner.

## Method -1
## In host system copying the configuration file multiple times and
## editing the conf file using "sed" than mounting the file to container while launching

for i in $(seq 1 $1)
do
   echo loop-no-$i
   cp  /home/ec2-user/execute-script-before-entrypoint-in-docker/my-httpd.conf /home/ec2-user/execute-script-before-entrypoint-in-docker/my-httpd-$i.conf
   sed -i "s/Listen 80/Listen 100$i/g" my-httpd-$i.conf
   docker run -dit --name web-$i -p 100$i:100$i -v  /home/ec2-user/execute-script-before-entrypoint-in-docker/my-httpd-$i.conf:/usr/local/apache2/conf/httpd.conf httpd
done

rm -f my-httpd-*.conf

# -p host-sys-port:container-port

