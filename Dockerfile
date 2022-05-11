FROM node:latest

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . . 

RUN npm i 
RUN npx prisma generate
RUN npx prisma migrate dev

#só executa quando rodarmos a imagem
CMD ["node", "server.js", "dev:migrate"] 

