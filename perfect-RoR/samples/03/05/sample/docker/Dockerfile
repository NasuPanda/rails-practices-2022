FROM buildpack-deps

RUN apt-get update && apt-get install -y \
    cmake \
    && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 https://github.com/h2o/h2o \
    && cd h2o \
    && git submodule update --init --recursive \
    && cmake . \
    && make install \
    && rm -rf /h2o

WORKDIR /work
RUN mkdir /work/log \
    &&  mkdir /work/conf

RUN openssl req -nodes -x509 -new -days 36500 -subj "/CN=localhost" -keyout /work/localhost.key -out /work/localhost.crt
ADD h2o.conf /work/conf/h2o.conf

ENTRYPOINT ["h2o", "-c", "/work/conf/h2o.conf"]
