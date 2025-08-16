FROM python:2.7

RUN apt-get update && apt-get install -y golang && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY . /src

WORKDIR /workspace

ENTRYPOINT ["python", "/src/TdrCodeGen/tdr.py"]