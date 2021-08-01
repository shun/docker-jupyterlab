FROM ubuntu:20.04

ENV WORKUSER jupyter
ARG LOCALUID=1000
ARG LOCALGID=1000
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt upgrade -y \
    && groupadd --gid $LOCALGID $WORKUSER \
    && useradd --uid $LOCALUID --gid $WORKUSER --shell /bin/bash --create-home $WORKUSER \
    && gpasswd -a $WORKUSER video \
    && apt install -y \
	curl \
	cython3 \
	gcc \
	gfortran \
	git \
	libatlas-base-dev \
	libatlas-base-dev \
	libatlas3-base \
	libblas-dev \
	libc-ares-dev \
	libeigen3-dev \
	libgfortran5 \
	libhdf5-dev \
	liblapack-dev \
	libopenblas-base \
	libopenblas-dev \
	libopencv-dev \
	libopenmpi-dev \
	openmpi-bin \
	python3-dev \
	python3-pip \
	tmux \
	vim \
	wget \
        v4l-utils\
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /home/$WORKUSER
USER $WORKUSER

RUN pip3 install pip --upgrade \
    && curl -LO "https://raw.githubusercontent.com/PINTO0309/Tensorflow-bin/main/tensorflow-2.5.0-cp38-none-linux_aarch64_download.sh" \
    && bash ./tensorflow-2.5.0-cp38-none-linux_aarch64_download.sh  \
    && pip3 install tensorflow-2.5.0-cp38-none-linux_aarch64.whl \
    && pip3 install -U --user six==1.15.0 wheel mock \
    && pip3 install pybind11  \
    && pip3 install keras_applications==1.0.8 --no-deps  \
    && pip3 install keras_preprocessing==1.1.0 --no-deps  \
    && pip3 install -U pandas \
    && pip3 install -U numpy==1.20.3 \
    && pip3 install -U opencv-python \
    && pip3 install -U jupyterlab \
    && pip3 install -U matplotlib \
    && pip3 install -U scipy \
    && pip3 install -U sklearn \
    && pip3 install -U seaborn \
    && rm tensorflow-2.5.0-cp38-none-linux_aarch64.whl \
    && rm tensorflow-2.5.0-cp38-none-linux_aarch64_download.sh \
    && rm -rf ~/.cache/pip

COPY ./jupyterlab/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--no-browser"]
