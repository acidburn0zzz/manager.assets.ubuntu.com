FROM ubuntu:focal

# Set up environment
ENV LANG C.UTF-8
WORKDIR /srv

# System dependencies
RUN apt-get update -y && apt-get install -y --no-install-recommends python3 python3-setuptools python3-pip

# Set git commit ID
ARG BUILD_ID
ENV TALISKER_REVISION_ID "${BUILD_ID}"

# Import code, install code dependencies
COPY . .
RUN python3 -m pip install --no-cache-dir -r requirements.txt

# Setup commands to run server
ENTRYPOINT ["./entrypoint"]
CMD ["0.0.0.0:80"]