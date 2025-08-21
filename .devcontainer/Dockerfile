FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y \
        git ssh make gcc gcc-multilib g++-multilib \
        module-assistant expect g++ gawk texinfo libssl-dev \
        bison flex fakeroot cmake unzip gperf autoconf \
        device-tree-compiler libncurses5-dev pkg-config bc \
        python-is-python3 passwd openssl openssh-server \
        openssh-client vim file cpio rsync

RUN apt-get install -y sudo

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers