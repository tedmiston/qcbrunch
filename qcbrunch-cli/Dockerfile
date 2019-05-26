FROM python:3.7.3-stretch

# WORKDIR /github/workspace/

RUN pwd
RUN ls -al

RUN cd qcbrunch-cli/ && pip install -e .

ENV QCBRUNCH_ROOT /github/workspace

RUN qcbrunch --help

# CMD qcbrunch --help
# CMD qcbrunch clean && qcbrunch render && qcbrunch build
