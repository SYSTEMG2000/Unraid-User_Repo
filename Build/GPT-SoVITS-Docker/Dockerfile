# Base CUDA image
FROM cnstark/pytorch:2.0.1-py3.9.17-cuda11.8.0-ubuntu20.04

LABEL maintainer="system@oasistem.com"
LABEL version="20240821-v2"
LABEL description="Docker image for GPT-SoVITS"

# Install 3rd party apps
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
RUN apt-get update && \
    apt-get install -y --no-install-recommends tzdata ffmpeg libsox-dev parallel aria2 git git-lfs && \
    git lfs install && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 9871 9872 9873 9874 9880

# Default startup command
CMD ["python", "webui.py"]
