FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04

ENV PYENV_ROOT /root/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

RUN apt-get update && apt-get install -y --no-install-recommends \
         build-essential \
         cmake \
         git \
         curl \
         ca-certificates \
         libjpeg-dev \
         mercurial \
         libffi-dev \
         libreadline-gplv2-dev \
         libncursesw5-dev \
         libssl-dev \
         libsqlite3-dev \
         tk-dev libgdbm-dev \
         libc6-dev \
         libbz2-dev \
         gosu \
         libpng-dev && \
     rm -rf /var/lib/apt/lists/*

RUN curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
RUN pyenv install 3.7.4
RUN pyenv global 3.7.4
RUN pip install --upgrade pip

RUN rm -rf /usr/bin/python /usr/bin/pip
RUN ln -s /usr/bin/python3 /usr/bin/python & \
    ln -s /usr/bin/pip3 /usr/bin/pip

WORKDIR /code
ADD requirements.txt /code
RUN pip install -r requirements.txt

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
