# Ubuntu公式リポジトリよりイメージを取得
FROM amd64/ubuntu:latest

ENV PATH /usr/local/bin:$PATH

# apt-get config
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NOWARNINGS yes

RUN apt-get update \
  && apt-get install -y \
    locales tzdata \
    man man-db \
    ca-certificates libssl-dev\
    software-properties-common net-tools libtool 


RUN apt-get update \
  && apt-get install -y \
    build-essential autoconf automake cmake cproto gettext g++ ninja-build \
    zlib1g-dev libffi-dev

# Commands
RUN apt-get update \
  && apt-get install -y \
    zip curl wget sed hstr

# Languages - Shell
RUN apt-get update \
  && apt-get install -y \
    zsh

# Languages - Nodejs
RUN apt-get update \
  && apt-get install -y \
    nodejs npm
RUN npm install -g yarn

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

ENV USER me
ENV HOME /home/$USER

# user/pass
RUN useradd -m $USER
RUN gpasswd -a $USER sudo
RUN echo "$USER:0000" | chpasswd


##
# Workspace
##
USER $USER
WORKDIR $HOME
