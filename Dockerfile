FROM python:3.6-alpine
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/

RUN apk add --update \
    python \
    python-dev \
    gcc \
    py-pip \
    build-base \
    mariadb-dev \
    wget \
    libxslt-dev \
    xmlsec-dev \
    # Pillow dependencies
    jpeg-dev \
    zlib-dev \
    freetype-dev \
    lcms2-dev \
    openjpeg-dev \
    tiff-dev \
    tk-dev \
    tcl-dev \
    harfbuzz-dev \
    fribidi-dev
# Install requirements
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
ADD . /code/
