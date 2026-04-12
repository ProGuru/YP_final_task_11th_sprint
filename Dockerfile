FROM golang:1.26.2

# Далее, если мы указываем каталог "./", то файлы попадают в каталог "/app"
WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY *.go *.db ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /parcel

CMD ["/parcel"]
