# docker
FROM golang:alpine

RUN apk update && apk add git

RUN mkdir /go/src/app
COPY ./ /go/src/app
WORKDIR /go/src/app
COPY ./src/go.mod .
COPY ./src/go.sum .

RUN go get -u github.com/cosmtrek/air && \
  go build -o /go/bin/air github.com/cosmtrek/air

CMD ["air", "-c", ".air.toml"]
