FROM ubuntu:22.10

# Hack to make tzdata install without prompting for a timezone.
ENV TZ=Europe/Copenhagen
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && apt install -y \
    default-jre \
    texlive-latex-extra \
    librsvg2-bin \
    plantuml \
    pandoc

RUN which pandoc

COPY filters ~/.pandoc/filters

ENTRYPOINT ["/usr/bin/pandoc"]