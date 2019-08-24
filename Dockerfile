FROM node:alpine AS build-stage
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
CMD npm run build

FROM nginx
COPY --from=build-stage /app/dist /usr/share/nginx/html
