#!/bin/bash
mkdir certs
# 私钥、证书
openssl req -nodes -newkey rsa:2048 -keyout certs/tls.key -out certs/tls.csr -subj "/C=/ST=/L=/O=/OU=/CN=traefik-tls"
# 证书自签名
openssl x509 -req -sha256 -days 365 -in certs/tls.csr -signkey certs/tls.key -out certs/tls.crt
# 生成secret对象
kubectl create secret generic cafe-secret --from-file=certs