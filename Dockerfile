FROM qiime2/core
MAINTAINER Harsha Krishnareddy <c0mpiler@outlook.com>

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update && apt-get -y upgrade && apt-get install -y --no-install-recommends apt-utils apt-file
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
			build-essential \
      devscripts \
			vim \
			ca-certificates \
			bzip2 \
			gcc \
			libgdbm-dev \
			libc-dev \
			ncurses-dev \
			openssl \
			openssl \
			pax-utils \
			tcl-dev \
			tk \
			tk-dev \
			git \
      libstdc++ \
      g++ \
      make \
      perl

# USER root

RUN python3 -m pip --no-cache-dir install pip -U
RUN python3 -m pip --no-cache-dir install pandas matplotlib
RUN python3 -m pip install pyqt5
RUN python3 -m pip install omxware

RUN rm -rf /tmp/build

COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh / # backwards compat

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/bin/bash"]
