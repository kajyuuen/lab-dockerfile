FROM pytorch/pytorch

RUN apt-get update && apt-get install -y --no-install-recommends \
    emacs

RUN conda install notebook
