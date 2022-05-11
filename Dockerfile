FROM node:latest

# diretório criado no container
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# copia todos os arquivos para o container
COPY package.json /usr/src/app/
COPY . . 


RUN npm i 
RUN npx prisma generate

COPY . /usr/src/app

#só executa quando rodarmos a imagem
CMD ["node", "server.js", "dev:migrate"] 

