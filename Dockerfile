FROM stackbrew/ubuntu:saucy

# Install NodeJS
RUN	apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common curl
RUN DEBIAN_FRONTEND=noninteractive add-apt-repository -y ppa:chris-lea/node.js
RUN	apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install nodejs git

# Install Hipache
RUN	npm install -g hipache
ADD	run.sh /run.sh
RUN chmod +x /run.sh
RUN mkdir /var/log/hipache

EXPOSE 80

ENTRYPOINT /run.sh
