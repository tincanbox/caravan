# Ubuntu公式リポジトリよりイメージを取得
FROM amd64/ubuntu:latest AS core

ENV PATH /usr/local/bin:$PATH

# apt-get config
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NOWARNINGS yes

RUN apt-get update && apt upgrade -y

RUN apt-get update \
  && apt-get install -y \
    locales tzdata \
    man man-db \
    ca-certificates libssl-dev\
    software-properties-common net-tools libtool 

RUN apt-get update \
  && apt-get install -y \
    build-essential autoconf automake cmake cproto gettext g++ ninja-build \
    zlib1g-dev libffi-dev gnupg

# Commands
RUN apt-get update \
  && apt-get install -y \
    zip unzip curl wget sed hstr sudo




FROM core AS workspace

RUN apt-get update && apt upgrade -y

# Languages - Shell
RUN apt-get update \
  && apt-get install -y \
    zsh

# Languages - Nodejs
# RUN apt-get update \
#   && apt-get install -y \
#     nodejs npm

RUN curl -fsSL https://raw.githubusercontent.com/tj/n/master/bin/n | bash -s lts
RUN npm install -g npm \
  && npm install -g n \
  && n install latest
RUN npm install -g yarn && yarn config set workspaces-experimental true

# Languages - Python
RUN apt-get update \
  && apt-get install -y \
    python-is-python3 pip

# Languages - Haskell Stack
RUN curl -sSL https://get.haskellstack.org/ | sh

# Tools
RUN apt-get update \
  && apt-get install -y \
    git

# Tools - nvim
RUN git clone https://github.com/neovim/neovim
RUN cd neovim \
    && make CMAKE_BUILD_TYPE=Release \
    && make install
  



FROM workspace

##
# Locale
##

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.en


##
# Shell
##

RUN zsh
ENV SHELL /usr/bin/zsh
RUN sed -i.bak "s|$HOME:|$HOME:$SHELL|" /etc/passwd


##
# User
## 

ENV USER dev
ENV HOME /home/$USER

# user/pass
RUN useradd -m $USER
RUN gpasswd -a $USER sudo
RUN echo "$USER:$USER" | chpasswd


##
# Workspace
##
USER $USER
WORKDIR $HOME
COPY --chmod=0755 --chown=dev burden/ .

CMD [ "sh", "-c", "$SHELL" ]
