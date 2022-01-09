sudo docker-compose -f docker-compose.yml down
sudo docker rmi -f $(sudo docker images -qa)
sudo docker rm -f $(sudo docker ps -qa)
sudo docker rm -f $(sudo docker ps -ls)
sudo docker volume rm $(sudo docker volume ls -q)
sudo docker image ls -q | xargs -I {} sudo docker image rm -f {}
sudo docker system prune -a --volume
sudo docker system prune -a --force
sudo rm -Rf ../data/database
sudo rm -Rf ../data/wordpress
sudo mkdir ../data/database
sudo mkdir ../data/wordpress
