FROM node:alpine as Builder
WORKDIR /app
#when using npm ci, package-lock.json is required
COPY package*.json ./
RUN npm install
COPY . .

FROM node:alpine as Production
WORKDIR /app
COPY --from=Builder /app/package.json ./
COPY --from=Builder /app/node_modules ./node_modules
EXPOSE 3000
CMD ["node", "src/index.js"]
