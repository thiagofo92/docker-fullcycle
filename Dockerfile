FROM golang:alpine AS builder

RUN apk update && apk add --no-cache git
WORKDIR /home/golang
COPY . .

RUN go build -o /go/bin/fullcycle

FROM scratch

COPY --from=builder /go/bin/fullcycle /go/bin/fullcycle 

ENTRYPOINT ["/go/bin/fullcycle"]
