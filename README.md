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
```
sudo curl -fsSL https://raw.githubusercontent.com/dbrosy/scripts/master/ubuntu-server-sudo.sh > /tmp/ubuntu-server-sudo.sh && bash /tmp/ubuntu-server-sudo.sh
```

#### install Docker + Docker-Compose
```

sudo curl -fsSL https://raw.githubusercontent.com/dbrosy/scripts/master/install-docker.sh > /tmp/install-docker.sh && bash /tmp/install-docker.sh

```
