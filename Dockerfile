# Using the Ubuntu image
FROM goodguide/base

MAINTAINER GoodGuide <docker@goodguide.com>

# Python binary dependencies, developer tools
RUN apt-get update \
 && apt-get install -y \
      build-essential \
      gcc \
      git \
      libcurl4-openssl-dev \
      libsqlite3-dev \
      libzmq3-dev \
      make \
      nodejs \
      pandoc \
      python2.7 \
      python-dev \
      python-pip \
      sqlite3 \
      zlib1g-dev \
      libfreetype6-dev

VOLUME /notebooks
WORKDIR /notebooks

RUN pip install ipython[notebook]
RUN pip install pygments
RUN pip install pandas
RUN pip install matplotlib==1.3.1

EXPOSE 8888

CMD ["ipython", "notebook", "--no-browser", "--port", "8888", "--ip=*"]
