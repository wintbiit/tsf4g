FROM python:2.7-slim

COPY . /src

WORKDIR /workspace

ENTRYPOINT ["python", "/src/TdrCodeGen/tdr.py"]