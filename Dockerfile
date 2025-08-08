FROM python:2.7

WORKDIR /app
COPY . .
WORKDIR /app/TdrCodeGen

ENTRYPOINT ["python", "tdr.py"]