FROM lambci/lambda:build-python3.6

ENV LIBMAXMINDDB_VERSION=1.3.2

# Compilation work for libmaxminddb
RUN mkdir -p "/tmp/libmaxminddb-${LIBMAXMINDDB_VERSION}-build"
WORKDIR "/tmp/libmaxminddb-${LIBMAXMINDDB_VERSION}-build"
RUN curl -L -o "libmaxminddb-${LIBMAXMINDDB_VERSION}.tar.gz" "https://github.com/maxmind/libmaxminddb/releases/download/${LIBMAXMINDDB_VERSION}/libmaxminddb-${LIBMAXMINDDB_VERSION}.tar.gz"
RUN tar xf "libmaxminddb-${LIBMAXMINDDB_VERSION}.tar.gz"
WORKDIR "/tmp/libmaxminddb-${LIBMAXMINDDB_VERSION}-build/libmaxminddb-${LIBMAXMINDDB_VERSION}"
RUN ./configure --prefix=/opt/
RUN make -j 8
RUN make install
RUN ldconfig

# Compilation work for python maxminddb & geoip2 libraries
RUN pip install \
  --target=/opt/python/ \
  --global-option=build_ext --global-option="-L/var/lang/lib:/opt/lib" \
  --global-option=build_ext --global-option="-I/var/lang/include/python3.6m:/opt/include" \
  maxminddb
RUN pip install --target=/opt/python/ geoip2

# Download the DBs!
RUN mkdir /opt/maxminddb
WORKDIR /opt/maxminddb
RUN curl http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz | tar xz
RUN curl http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.tar.gz | tar xz
RUN curl http://geolite.maxmind.com/download/geoip/database/GeoLite2-ASN.tar.gz | tar xz
RUN mv */*.mmdb . && rm -r GeoLite2-{ASN,City,Country}_*/

# set workdir back
WORKDIR /var/task
