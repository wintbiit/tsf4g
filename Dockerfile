FROM python:2.7

COPY . /src

WORKDIR /workspace

ENTRYPOINT ["python", "/src/TdrCodeGen/tdr.py"]