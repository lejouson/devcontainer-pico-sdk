FROM alpine:20250108 AS pico-sdk
LABEL org.opencontainers.image.title="Raspberry Pi Pico SDK Dev Container"
LABEL org.opencontainers.image.source="https://github.com/jisbert/devcontainer-pico-sdk"
LABEL org.opencontainers.image.description="Containerized environment for developing C/C++ Raspberry Pi Pico SDK based applications."
ENV PICO_SDK_PATH=/pico-sdk
ENV CMAKE_GENERATOR=Ninja
RUN apk add --no-cache \
  -X https://dl-cdn.alpinelinux.org/alpine/edge/testing \
  cmake=3.31.4-r0 \
  cpputest=4.0-r2 \
  doxygen=1.13.2-r0 \
  g++=14.2.0-r5 \
  g++-arm-none-eabi=14.2.0-r1 \
  git=2.48.0-r0 \
  gzip=1.13-r0 \
  lcov=2.0-r3 \
  python3=3.12.8-r1 \
  samurai=1.2-r6
RUN git clone -b master --depth=1 https://github.com/raspberrypi/pico-sdk.git ${PICO_SDK_PATH} \
  && git -C ${PICO_SDK_PATH}/lib submodule update --init --depth=1 \
  && git -C ${PICO_SDK_PATH}/lib/tinyusb submodule update --init --depth=1 hw/mcu/raspberry_pi
