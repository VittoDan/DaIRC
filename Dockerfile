FROM ubuntu:latest
ARG sicstustarball=https://sicstus.sics.se/sicstus/products4/sicstus/4.9.0/binaries/linux/sp-4.9.0-x86_64-linux-glibc2.28.tar.gz
WORKDIR /home/ubuntu
COPY ./dockerconfig/installcachetoinject.cache /home/ubuntu/install.cache
RUN apt-get update && apt-get install -y tmux vim lsof wget gzip nodejs npm inetutils-ping
RUN npm i -g http-server
RUN wget $sicstustarball && \
    mkdir sicstus && \
    tar -xvf $(basename $sicstustarball) -C sicstus --strip-components=1 && \
    rm $(basename $sicstustarball) && \
    mv -f install.cache ./sicstus && \
    cd sicstus && \
    ./InstallSICStus && \
    chmod +x /usr/local/sicstus4.9.0/bin/sicstus
COPY . /home/ubuntu/DALI
WORKDIR /home/ubuntu/DALI
ADD windowlayout.sh /home/ubuntu
RUN chmod +x /home/ubuntu/windowlayout.sh


CMD ["/home/ubuntu/windowlayout.sh"]
