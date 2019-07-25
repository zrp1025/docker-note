docker network create -d bridge --subnet=172.18.0.0/29 my-net

docker run --rm -d --net my-net --ip 172.18.0.2 --hostname my-first --name first nginx:latest

docker run --rm -d --net my-net --ip 172.18.0.3 --hostname my-second --name second nginx:latest

docker run --rm -d --net my-net --ip 172.18.0.4 --hostname my-third --name third nginx:latest

docker exec first apt-get update

docker exec first apt-get install iputils-ping

docker exec second apt-get update

docker exec second apt-get install iputils-ping

docker exec third apt-get update

docker exec third apt-get install iputils-ping

docker exec first ping -c 2 172.18.0.3

docker exec first ping -c 2 172.18.0.4

docker exec second ping -c 2 172.18.0.2

docker exec second ping -c 2 172.18.0.4

docker exec third ping -c 2 172.18.0.2

docker exec third ping -c 2 172.18.0.3

docker stop first 

docker stop second

docker stop third 

docker network 

docker network rm my-net

