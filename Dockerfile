FROM python:2.7-slim

# Install go
RUN sed -i 's|deb http://deb.debian.org/debian|deb http://archive.debian.org/debian|g' /etc/apt/sources.list && \
    sed -i 's|deb http://security.debian.org/debian-security|deb http://archive.debian.org/debian-security|g' /etc/apt/sources.list && \
    sed -i '/buster-updates/d' /etc/apt/sources.list && \
    apt-get -o Acquire::Check-Valid-Until=false update && \
    apt-get install -y golang git && \
    rm -rf /var/lib/apt/lists/*

RUN go get golang.org/x/tools/cmd/goimports && goimports -v

COPY . /src

WORKDIR /workspace

ENTRYPOINT ["python", "/src/TdrCodeGen/tdr.py"]