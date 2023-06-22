FROM alpine:20230329 AS pico-sdk
LABEL org.opencontainers.image.title="Raspberry Pi Pico SDK Dev Container"
LABEL org.opencontainers.image.source="https://github.com/jisbert/devcontainer-pico-sdk"
LABEL org.opencontainers.image.description="Containerized environment for developing C/C++ Raspberry Pi Pico SDK based applications."
ENV PICO_SDK_PATH=/pico-sdk
ENV CMAKE_GENERATOR=Ninja
RUN apk add --no-cache \
  -X https://dl-cdn.alpinelinux.org/alpine/edge/testing \
  cmake=3.26.4-r1 \
  cpputest=4.0-r1 \
  doxygen=1.9.7-r0 \
  g++-13.1.1_git20230617-r0 \
  g++-arm-none-eabi=13.1.0-r0 \
  git=2.41.0-r0 \
  gzip=1.12-r1 \
  lcov=2.0-r1 \
  python3=3.11.4-r0 \
  samurai=1.2-r4
RUN git clone -b master --depth=1 https://github.com/raspberrypi/pico-sdk.git ${PICO_SDK_PATH} \
  && git -C ${PICO_SDK_PATH}/lib submodule update --init --depth=1 \
  && git -C ${PICO_SDK_PATH}/lib/tinyusb submodule update --init --depth=1 hw/mcu/raspberry_pi
