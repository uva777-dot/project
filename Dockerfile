FROM node

WORKDIR /project

RUN npm install express

RUN mkdir /public

COPY server.js /project

COPY index.html /project/public/

EXPOSE 2500

CMD ["node","server.js"]
