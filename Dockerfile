FROM node:latest

WORKDIR /home/aicon/editor

COPY ./data/node ./
COPY ./src ./

RUN apt-get update -y && \
	apt-get install -y sudo --no-install-recommends apt-utils && \
	apt-get install -y vim && \
	apt-get install -y less

RUN npm i npm@latest -g

# express ot socket.ioをインストール
RUN npm install --save express ot socket.io

# serverを永続的に起動
RUN npm install -g forever