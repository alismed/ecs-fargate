FROM node:23.11.0-alpine
 
WORKDIR '/app'
COPY package.json .
RUN yarn
COPY . .
EXPOSE 3000
 
CMD ["node", "index.js"]