FROM gitpod/workspace-full

RUN brew install jsonnet

# upgrade pyenv to use python 3.8.0
RUN cd /home/gitpod/.pyenv/plugins/python-build/../.. && git pull && cd -
RUN pyenv install 3.8.0
RUN pyenv global 3.8.0
RUN pip3 install --upgrade pip
RUN pip3 install pipenv

RUN npm install -g npm
RUN npm install -g now
