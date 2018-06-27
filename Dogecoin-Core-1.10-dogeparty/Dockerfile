FROM debian:9.4

RUN \
  apt-get update && \
  apt-get install -y wget && \
  apt-get clean

ENV DOGECOIN=dogecoin-1.10.0

RUN \
  wget https://github.com/dogecoin/dogecoin/releases/download/v1.10.0-dogeparty/dogecoin-1.10.0-linux64.tar.gz && \
  tar xvzf dogecoin-1.10.0-linux64.tar.gz && \
  rm dogecoin-1.10.0-linux64.tar.gz && \
  \
  cp ${DOGECOIN}/bin/* /usr/local/bin/. && \
  cp ${DOGECOIN}/include/* /usr/local/include/. && \
  cp ${DOGECOIN}/lib/* /usr/local/lib/. && \
  rm -rf ${DOGECOIN}

ENTRYPOINT dogecoind -testnet -gen