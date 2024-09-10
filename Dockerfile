FROM 416670754337.dkr.ecr.eu-west-2.amazonaws.com/ci-base-build:1.0.3

RUN dnf upgrade -y && \
    dnf install -y \
    make \
    python3.11 \
    python3.11-devel \
    python3.11-pip \
    python3.11-setuptools && \
    dnf clean all

COPY requirements.txt /requirements.txt

RUN python3.11 -m pip install --no-cache-dir -r /requirements.txt && \
    rm /requirements.txt
