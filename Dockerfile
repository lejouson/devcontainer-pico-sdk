FROM alpine:20251224 AS pico-sdk
LABEL org.opencontainers.image.title="Raspberry Pi Pico SDK Dev Container"
LABEL org.opencontainers.image.source="https://github.com/jisbert/devcontainer-pico-sdk"
LABEL org.opencontainers.image.description="Containerized environment for developing C/C++ Raspberry Pi Pico SDK based applications."
ENV PICO_SDK_PATH=/pico-sdk
ENV CMAKE_GENERATOR=Ninja
RUN apk add --no-cache \
  -X https://dl-cdn.alpinelinux.org/alpine/edge/testing \
  cmake=4.1.3-r0 \
  cpputest=4.0-r2 \
  doxygen=1.13.2-r0 \
  g++=15.2.0-r2 \
  g++-arm-none-eabi=15.2.0-r0 \
  git=2.52.0-r0 \
  gzip=1.14-r2 \
  lcov=2.3.1-r1 \
  python3=3.12.12-r0 \
  samurai=1.2-r7
RUN git clone -b master --depth=1 https://github.com/raspberrypi/pico-sdk.git ${PICO_SDK_PATH} \
  && git -C ${PICO_SDK_PATH}/lib submodule update --init --depth=1
