#!/bin/bash

go get -v \
    github.com/jteeuwen/go-bindata/... \
    github.com/dustin/go-humanize \
    github.com/julienschmidt/httprouter \
    github.com/Sirupsen/logrus \
    github.com/gorilla/securecookie \
    golang.org/x/crypto/acme/autocert \
    golang.org/x/time/rate \
	golang.org/x/crypto/bcrypt \
    go.uber.org/zap \
	gopkg.in/gomail.v2 \
    github.com/crewjam/saml \
    github.com/dgrijalva/jwt-go \
    github.com/skip2/go-qrcode \
    github.com/crewjam/httperr

go-bindata --pkg main static/... templates/... email/...
go fmt
go vet --all
go build -v --compiler gc --ldflags "-extldflags -static -s -w -X main.version=1.0.0" -o app

./app --http-host localhost --letsencrypt=false
