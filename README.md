# Ubiquiti Utilities
### Become Root user
```bash
sudo bash
```

### Update Speedtest-cli
```bash
curl -sLo update_speedtest.sh https://raw.githubusercontent.com/dbrosy/scripts/master/update_speedtest.sh
chmod +x update_speedtest.sh
sudo ./update_speedtest.sh
exit
```
#### Run Speedtest-cli
```bash
speedtest-cli
```

#### Configure sudo user - ubuntu
```sh

curl -fsSL https://raw.githubusercontent.com/dbrosy/scripts/master/ubuntu-server-sudo.sh > /tmp/ubuntu-server-sudo.sh && sudo bash /tmp/ubuntu-server-sudo.sh

```

#### Configure timezone >= Ubuntu 18.04

_Auckland_
```sh,
sudo timedatectl set-timezone 'Pacific/Auckland'
```

_Sydney_
```sh
sudo timedatectl set-timezone 'Australia/Sydney'
```

_Apply_
```sh
sudo dpkg-reconfigure --frontend noninteractive tzdata
```

#### install Docker + Docker-Compose
```sh
sudo apt install docker.io
sudo systemctl enable --now docker
sudo usermod -aG docker $USER

sudo apt install docker-compose
```
or

```sh
curl -fsSL https://raw.githubusercontent.com/dbrosy/scripts/master/install-docker.sh > /tmp/install-docker.sh && bash /tmp/install-docker.sh
```
##### Note - if docker-compose hangs

###### Check entropy and fix if required
```sh
cat /proc/sys/kernel/random/entropy_avail
# around 5

sudo apt install -y haveged
systemctl status haveged.service

cat /proc/sys/kernel/random/entropy_avail
# 2400 or more
```

##### Tracing docker
```sh
strace -c docker-compose --version
```
