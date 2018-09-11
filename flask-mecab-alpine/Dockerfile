FROM alpine:3.8

RUN apk add --update alpine-sdk \
  && apk --no-cache add python3 python3-dev gfortran lapack lapack-dev postgresql-dev openblas curl git xz bash sudo \
  && rm -rf /var/cache/* \
  && rm -rf /root/.cache/*

WORKDIR /opt
RUN git clone https://github.com/taku910/mecab.git
WORKDIR /opt/mecab/mecab
RUN ./configure  --enable-utf8-only --with-charset=utf8 \
  && make \
  && make check \
  && make install

WORKDIR /opt/mecab/mecab-ipadic
RUN ./configure --with-charset=utf8 \
  && make \
  && make install

WORKDIR /opt
RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git
WORKDIR /opt/mecab-ipadic-neologd
RUN ./bin/install-mecab-ipadic-neologd -n -y

RUN pip3 install --upgrade setuptools
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h

COPY requirements.build /opt/requirements.build
WORKDIR /opt
RUN pip3 install -r requirements.build