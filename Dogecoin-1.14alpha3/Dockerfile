FROM debian:9.4

RUN apt-get update
RUN apt-get install -y build-essential libtool autotools-dev autoconf pkg-config libssl-dev libboost-all-dev libdb++-dev libminiupnpc-dev

RUN apt-get install -y wget apt-utils vim
RUN wget https://github.com/dogecoin/dogecoin/archive/v1.14-alpha-3.tar.gz && \
  tar xvzf v1.14-alpha-3.tar.gz && \
  rm v1.14-alpha-3.tar.gz

# ================== Install Berkeley DB ===================================== #

ENV \
  BITCOIN_ROOT=/dogecoin-1.14-alpha-3 \
  BDB_PREFIX="/${BITCOIN_ROOT}/db5"

WORKDIR ${BITCOIN_ROOT}

# Pick some path to install BDB to
RUN mkdir -p $BDB_PREFIX

# Fetch the source and verify that it is not tampered with
RUN wget 'http://download.oracle.com/berkeley-db/db-5.1.29.NC.tar.gz'
RUN echo '08238e59736d1aacdd47cfb8e68684c695516c37f4fbe1b8267dde58dc3a576c db-5.1.29.NC.tar.gz' | sha256sum -c

RUN \
  tar -xzvf db-5.1.29.NC.tar.gz && \
  rm db-5.1.29.NC.tar.gz

# Build the library and install to our prefix
WORKDIR /${BITCOIN_ROOT}/db-5.1.29.NC/build_unix/

#  Note: Do a static build so that it can be embedded into the executable, instead of having to find a .so at runtime
RUN \
  ../dist/configure \
  --enable-cxx \
  --disable-shared \
  --with-pic \
  --prefix=$BDB_PREFIX
RUN make install

# ================== Install Dogecoin Core =================================== #
WORKDIR $BITCOIN_ROOT

RUN ./autogen.sh

RUN apt-get install -y bsdmainutils
RUN apt-get install -y libevent-dev

# Configure Dogecoin Core to use our own-built instance of BDB
RUN ./configure LDFLAGS="-L${BDB_PREFIX}/lib/" CPPFLAGS="-I${BDB_PREFIX}/include/" --without-gui

RUN make

RUN make install










