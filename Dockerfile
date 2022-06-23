FROM nvidia/cuda:11.3.1-devel-ubuntu20.04

ENV BLENDER_MAJOR 3.2
ENV BLENDER_VERSION 3.2.0
ENV BLENDER_URL https://download.blender.org/release/Blender${BLENDER_MAJOR}/blender-${BLENDER_VERSION}-linux-x64.tar.xz

RUN apt-get update && \
	apt-get install -y curl wget nano bzip2 libfreetype6 libgl1-mesa-dev libglu1-mesa libxi6 libxrender1 && \
	apt-get -y autoremove

RUN mkdir /usr/local/blender && \
	wget ${BLENDER_URL} -O blender.tar.xz && \
	tar -xvf blender.tar.xz -C /usr/local/blender --strip-components=1 && \
	rm blender.tar.xz

ENTRYPOINT ["/usr/local/blender/blender", "--background", "-noaudio", "-o", "/mnt"]
