FROM golang:alpine as builder

WORKDIR /usr/app
COPY . .
RUN go build -ldflags "-s -w" -o app .


FROM scratch
WORKDIR /usr/app
COPY --from=builder /usr/app/app /
CMD ["/app"]


