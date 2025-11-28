FROM python:2.7

# Install go
RUN apt-get update && \
    apt-get install -y golang && \
    rm -rf /var/lib/apt/lists/*

RUN go install golang.org/x/tools/cmd/goimports@latest

COPY . /src

WORKDIR /workspace

ENTRYPOINT ["python", "/src/TdrCodeGen/tdr.py"]