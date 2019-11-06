#### Install Docker
```sh
curl -sSL https://get.docker.com | sh
sudo usermod -aG docker pi
```

#### Install Docker-Compose
```sh
sudo apt update
sudo apt install -y python python-pip libffi-dev python-backports.ssl-match-hostname
sudo pip install docker-compose
```

#### Updating Docker
```sh
sudo /etc/init.d/docker stop
curl -sSL https://get.docker.com | sh
```

#### Updating Docker-Compose
```sh
sudo apt install --upgrade python python-pip libffi-dev python-backports.ssl-match-hostname
sudo pip install --upgrade docker-compose
```

#### Reboot Device
```sh
sudo reboot
```

---

#### Extras

##### Portainer
```sh
docker pull portainer/portainer:linux-arm
docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer:linux-arm
```

##### Node-Red
```sh
docker volume create --name node_red_user_data
docker run -it -p 1880:1880 -v node_red_user_data:/data --name mynodered nodered/node-red
```

