FROM m0elnx/ubuntu-32bit
MAINTAINER Wenbo Wang <wenbo.wang@belkin.com>

RUN sed -i 's|http://archive|http://cn.archive|' /etc/apt/sources.list
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install build-essential \
	    libncurses5-dev \
	    libtool \
	    m4 \
	    automake \
	    autoconf \
	    libglib2.0-dev \
	    device-tree-compiler \
	    bison \
	    flex \
	    libreadline6-dev \
	    texinfo \
	    gawk \
	    lua5.1 \
	    tidy \
	    nodejs-legacy \
	    sharutils \
	    genext2fs \
	    mtd-utils \
	    gettext \
	    scons \
	    cmake \
	    rsync \
	    bc \
	    tclsh

ADD uname /usr/local/bin
ADD dmake /usr/local/bin
ENTRYPOINT ["dmake"]
