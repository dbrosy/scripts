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

#### Rebood Device
```sh
sudo reboot
```
