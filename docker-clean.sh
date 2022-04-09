


sudo docker stop $(sudo docker ps -a |  grep -v "portainer" | cut -d ' ' -f1) 
sudo docker kill $(sudo docker ps -a | grep -v "portainer" | cut -d ' ' -f1) # stop all containers
sudo docker rm $(sudo docker ps -a |  grep -v "portainer" | cut -d ' ' -f1) --force
sudo docker rmi $(sudo docker images -q | grep -v "portainer" | cut -d ' ' -f1) --force
echo y | sudo docker volume rm $(sudo docker volume ls | grep -v "portainer" | awk 'NR>1 {print $2}' ) --force

echo y | sudo docker network prune 
# sudo docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce

echo "done................."

# docker rm $(docker ps -a | grep -v "portainer/portainer-ce" | awk 'NR>1 {print $1}')
# docker stop $(docker ps -a -q | grep -v "my_container_id")
# docker rm $(docker ps -a -q | grep -v "my_container_id")
# docker rm $(docker ps -a | grep -v "my_docker" | awk 'NR>1 {print $1}')
# docker rm $(docker ps -a | grep -v "my_docker1" | grep -v "my_docker2" | cut -d ' ' -f1)
# Deletes all the images except node image
# sudo docker rmi -f $(sudo docker image ls -a | grep -v "node" | awk 'NR>1 {print $3}')
# docker volume ls
# docker volume rm volume_name volume_name
# $ docker volume rm $(docker volume ls -qf dangling=true)
# sudo docker-compose up --build --force-recreate