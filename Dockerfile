FROM node:16-buster AS deps

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install --frozen-lockfile --production=false

FROM node:16-buster AS builder

WORKDIR /app

COPY --from=deps /app/node_modules ./node_modules
COPY . .

ENV NEXT_PUBLIC_ENV=production
RUN yarn build

FROM node:16-buster

WORKDIR /app

ENV NODE_ENV production
ENV NEXT_PUBLIC_ENV production

COPY --from=deps /app/node_modules ./node_modules
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/package.json ./package.json

CMD yarn run start
