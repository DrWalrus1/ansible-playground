FROM ubuntu:latest AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y software-properties-common curl git build-essential 
RUN apt-add-repository -y ppa:ansible/ansible && \
	apt-get update && \
	apt-get install -y ansible ruby-full neovim && \
	apt-get clean autoclean && \
	apt-get autoremove --yes
COPY . .
CMD [ "sh", "-c", "ansible-playbook $TAGS playbook.yaml" ]
