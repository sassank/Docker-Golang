# Specifies a parent image
FROM golang:1.22.1
 
# Creates an app directory to hold your app’s source code
WORKDIR /app
 
# Copies everything from your root directory into /app
COPY go.mod .
COPY main.go .
 
# Builds your app with optional configuration
RUN go build -o bin .
 
# Tells Docker which network port your container listens on
EXPOSE 8080
 
# Specifies the executable command that runs when the container starts
ENTRYPOINT [ "/app/bin" ]