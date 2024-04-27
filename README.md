# luckfox-pico
Linux systems for luckfox pico

## Prerequisites

```bash
apt update
apt install -y git ssh make gcc gcc-multilib g++-multilib \
  module-assistant expect g++ gawk texinfo libssl-dev \
  bison flex fakeroot cmake unzip gperf autoconf \
  device-tree-compiler libncurses5-dev pkg-config bc \
  python-is-python3 passwd openssl openssh-server \
  openssh-client vim file cpio rsync
apt install docker.io
```

```bash
cd ./tools/linux/toolchain/arm-rockchip830-linux-uclibcgnueabihf/
```