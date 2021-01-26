FROM python:buster

RUN apt-get update && apt-get install -y ffmpeg && \
    pip install pandas numpy ffmpeg_bitrate_stats

ENTRYPOINT ["ffmpeg_bitrate_stats" ]