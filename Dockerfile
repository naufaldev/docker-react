FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm i
COPY . .
RUN npm run build

#/app/build <==prouction code
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html