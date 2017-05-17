FROM ubuntu:16.04
MAINTAINER @eaglesakura

# install script
ADD yaml2json.py  /root/yaml2json.py
ADD entrypoint.sh /root/entrypoint.sh

# install python tool
# install pip
RUN  apt-get update \
  && apt-get install -y python2.7 wget \
  && wget https://bootstrap.pypa.io/get-pip.py -O $HOME/get-pip.py \
  && python2.7 $HOME/get-pip.py \
  && rm $HOME/get-pip.py \
  && pip2 install pyyaml \
  && chmod 755 /root/entrypoint.sh

# entrypoint
ENTRYPOINT ["/root/entrypoint.sh"]

# run `docker run --rm -w /work -v /path/to/work/dir:/work eaglesakura/yaml2json "path/to/example.yaml"`
