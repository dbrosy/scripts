# Ubiquiti Utilities
### Become Root user
```bash
sudo bash
```

### Update Speedtest-cli
```bash
curl -sLo update_speedtest.sh https://raw.githubusercontent.com/dbrosy/scripts/master/update_speedtest.sh
chmod +x update_speedtest.sh
./update_speedtest.sh
exit
```
#### Run Speedtest-cli
```bash
speedtest-cli
```

#### install Docker + Docker-Compose
```
curl -fsSL https://raw.githubusercontent.com/dbrosy/scripts/master/docker-installer.sh > /tmp/docker_installer.sh && sudo bash /tmp/docker_installer.sh
```
