FROM python:3.8-slim

SHELL ["/bin/bash", "-c"]

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update --fix-missing && \
    apt-get install -y --no-install-recommends graphviz && \
    rm -rf /var/lib/apt/lists/* && \
    addgroup --system --gid 1001 appuser && \
    adduser --disabled-password --uid 1001 --ingroup appuser --gecos '' appuser && \
    pip install --no-cache-dir gprof2dot

USER appuser
WORKDIR /home/appuser

CMD ["/bin/bash", "--login", "-i"]
