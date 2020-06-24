FROM python:3.8.3

RUN apt-get update \
    && apt-get install -yq --no-install-recommends build-essential autoconf \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/app

COPY mtr* /opt/app/

RUN tar xzvf mtr-0.93.tar.gz && \
    cd mtr-0.93 && \
    patch -p1 < ../mtr-PR281.patch && \
    autoreconf && \
    ./configure && \
    make && \
    cd .. && \
    cp mtr-0.93/mtr . && \
    cp mtr-0.93/mtr-packet . && \
    rm -rf mtr-0.93/

COPY main.py /opt/app

CMD python main.py
