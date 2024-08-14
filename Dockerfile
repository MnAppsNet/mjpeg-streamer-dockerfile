FROM alpine:3.20 AS base

ARG REPO='https://github.com/jacksonliam/mjpg-streamer.git'

RUN apk add --no-cache cmake jpeg-dev gcc g++ git make libjpeg-turbo-dev linux-headers
WORKDIR /opt/
RUN git clone ${REPO}
RUN mv ./mjpg-streamer/* ./

WORKDIR /opt/mjpg-streamer-experimental/
RUN make
RUN make install

FROM base
ENV RES='640x480'
ENV FRAME_RATE='30'
ENV INPUT_ARGS=''
ENV OUTPUT_ARGS=''
WORKDIR /opt/mjpg-streamer-experimental/
RUN export LD_LIBRARY_PATH=.
CMD sh -c "./mjpg_streamer -i './input_uvc.so -n -f echo ${FRAME_RATE} -r ${RES} -d /dev/video0 ${INPUT_ARGS}' -o './output_http.so -w ./www -p 8080 ${OUTPUT_ARGS}'"