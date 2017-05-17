FROM ubuntu:16.04
MAINTAINER @eaglesakura

# install python tool
RUN  apt-get update \
  && apt-get install -y python2.7 wget

# install pip
RUN  wget https://bootstrap.pypa.io/get-pip.py -O $HOME/get-pip.py \
  && python $HOME/get-pip.py \
  && rm $HOME/get-pip.py

# install scripts
RUN pip2 install pyyaml
ADD yaml2json.py  /root/yaml2json.py
ADD entrypoint.sh /root/entrypoint.sh
RUN chmod 755 /root/entrypoint.sh

# entrypoint
ENTRYPOINT ["/root/entrypoint.sh"]
# run `docker run --rm eaglesakura/yaml2json "path/to/example.yaml"`
