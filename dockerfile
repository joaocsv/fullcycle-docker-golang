FROM golang as builder

WORKDIR /app/src/

COPY ./entry-point-docker.go .

RUN go build entry-point-docker.go && rm entry-point-docker.go

FROM scratch

COPY --from=builder /app/src/ .

ENTRYPOINT [ "./entry-point-docker" ]