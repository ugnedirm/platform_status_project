FROM alpine:3.20
RUN apk add --no-cache curl
WORKDIR /app
COPY check.sh .
RUN chmod +x check.sh
CMD ["./check.sh"]