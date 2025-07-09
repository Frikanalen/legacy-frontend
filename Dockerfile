FROM node:18-bullseye AS deps
WORKDIR /app

COPY package.json yarn.lock ./
RUN  yarn install

FROM node:18-bullseye AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .

ENV NEXT_TELEMETRY_DISABLED 1
ENV NEXT_PUBLIC_ENV production

ARG NEXT_PUBLIC_DJANGO_URL
ARG NEXT_PUBLIC_UPLOAD_URL

ENV NEXT_PUBLIC_DJANGO_URL=$NEXT_PUBLIC_DJANGO_URL
ENV NEXT_PUBLIC_UPLOAD_URL=$NEXT_PUBLIC_UPLOAD_URL
RUN yarn build

FROM node:18-bullseye AS runner
WORKDIR /app

ENV NODE_ENV production

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

COPY --from=builder --chown=nextjs:nodejs /app/.next ./.next
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json

USER nextjs

EXPOSE 3000

ENV PORT 3000

CMD ["npm", "start"]
