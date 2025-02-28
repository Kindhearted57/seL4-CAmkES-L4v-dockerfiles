#
# Copyright 2020, Data61/CSIRO
#
# SPDX-License-Identifier: BSD-2-Clause
#

ARG USER_BASE_IMG=trustworthysystems/sel4
# hadolint ignore=DL3006
FROM $USER_BASE_IMG

# This dockerfile is a shim between the images from Dockerhub and the
# user.dockerfile.
# Add extra dependencies in here!

# For example, uncomment this to get cowsay on top of the sel4/camkes/l4v
# dependencies:

# hadolint ignore=DL3008,DL3009
RUN apt-get update -q \
    && apt-get install -y --no-install-recommends \
        # Add more dependencies here
        cowsay \
        sudo

RUN apt-get update && apt install -y ghc
RUN apt install -y vim
RUN stack upgrade --binary-only && stack install cabal-install --local-bin-path /usr/local/bin
RUN which stack
ENV PATH="$PATH:/root/.local/bin:/usr/local/bin"
RUN cabal update
