FROM elixir:1.9

ENV DEBIAN_FRONTEND=noninteractive
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1

# Fix locale to use UTF-8
RUN apt-get update \
    && apt-get install -y apt-utils >/dev/null 2>&1 \
    && apt-get install -y --no-install-recommends locales \
    && echo "LC_ALL=en_US.UTF-8" >> /etc/environment \
    && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && echo "LANG=en_US.UTF-8" > /etc/locale.conf \
    && locale-gen en_US.UTF-8 2>&1

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get install -y --no-install-recommends \
      nodejs inotify-tools gcc g++ make \
    && rm -rf /var/lib/apt/lists/* \
    && npm install -g yarn \
    && mix local.hex --force \
    && mix local.rebar --force

WORKDIR /workspace
ENTRYPOINT ["/workspace/entrypoint.sh"]
