# luckfox-pico

Linux systems for LuckFox Pico series, including
Pico Mini b, Pico Plus and Pico Pro Max (all models with SPI flash).

Currently only [Alpine Linux](https://alpinelinux.org/) is available.

## Downloads

Check out
[Github Actions Artifacts](https://github.com/soyflourbread/luckfox-pico/actions/workflows/main.yml)
for latest Alpine Linux images.

## Flashing

See
[the official docs](https://wiki.luckfox.com/Luckfox-Pico/Linux-MacOS-Burn-Image)
for instructions on flashing `update.img` to your Pico board.

For example, to flash Pico Pro Max boards,
connect the board to your computer while pressing _BOOT_ key, then execute
```bash
sudo ./upgrade_tool uf pico-pro-max-sysupgrade.img
```

## Setting Up

The default username/password is `root:luckfox`.

UART serial debug port is enabled,
and `sshd` server is installed and enabled as well.

To connect to it via ethernet, simply do
```bash
ssh root@<ip_of_pico_board>
```

### RNDIS/Ethernet-over-USB

This system image has RNDIS enabled for all boards.
To connect to your Pico through RNDIS,
check out [the official guide](https://wiki.luckfox.com/Luckfox-Pico/SSH-Telnet-Login/).

The board's static IP is `172.32.0.93`.

Below is a brief guide to connect via RNDIS on Linux:
```bash
ip link # obtain network device name of pico
sudo ip addr add 172.32.0.100/16 dev <network_device_of_pico>
ping 172.32.0.93 # it works!
```

## Customization

Just fork this repo and trigger Github Actions after you made your changes!

For example,
* To add software packages, edit `bootstrap.sh`.
* To change files in the system image, edit `overlay/`.
