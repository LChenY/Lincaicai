FROM python:3.8

COPY . /build
RUN cd /build && pip install . && rm -rf /build
RUN cd / && pip install grpcio && pip install grpcio-tools && pip install protobuf

EXPOSE 8089 5557

RUN useradd --create-home locust
USER locust
WORKDIR /home/locust
ENTRYPOINT ["locust"]

# turn off python output buffering
ENV PYTHONUNBUFFERED=1
