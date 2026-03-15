FROM node

WORKDIR /project

RUN npm install express

RUN mkdir /public

COPY server.js /project

COPY index.html /project/public/

EXPOSE 5000

CMD ["node","server.js"]
