FROM pytorch/pytorch

ENV PYTHONIOENCODING "utf-8"

RUN apt-get update && apt-get install -y --no-install-recommends \
    emacs \
    language-pack-ja
    
RUN conda install notebook
