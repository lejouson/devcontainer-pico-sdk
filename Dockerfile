FROM alpine:20230329 AS pico-sdk
LABEL org.opencontainers.image.title="Docker Pico SDK"
LABEL org.opencontainers.image.source="https://github.com/jisbert/docker-pico-sdk"
LABEL org.opencontainers.image.description="Dockerized environment for building C/C++ PICO SDK based applications. Targeted for GitHub Actions."
ENV PICO_SDK_PATH=/pico-sdk
ENV CMAKE_GENERATOR=Ninja
RUN apk add --no-cache \
  -X https://dl-cdn.alpinelinux.org/alpine/edge/testing \
  git=2.41.0-r0 \
  cmake=3.26.4-r1 \
  cpputest=4.0-r1 \
  g++=13.1.1_git20230603-r10 \
  g++-arm-none-eabi=13.1.0-r0 \
  lcov=2.0-r1 \
  python3=3.11.4-r0 \
  samurai=1.2-r4
RUN git clone -b master --depth=1 https://github.com/raspberrypi/pico-sdk.git ${PICO_SDK_PATH} \
  && git -C ${PICO_SDK_PATH}/lib submodule update --init --depth=1 \
  && git -C ${PICO_SDK_PATH}/lib/tinyusb submodule update --init --depth=1 hw/mcu/raspberry_pi
