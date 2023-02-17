FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y \
  python3 libxml2-utils python3-pip curl

RUN pip3 install --upgrade --user svdtools
ENV PATH=$PATH:/root/.local/bin

RUN curl https://sh.rustup.rs -sSf | bash -s -- \
  --default-toolchain stable --profile minimal -y
ENV PATH=$PATH:/root/.cargo/bin

RUN cargo install svd2rust
RUN rustup component add rustfmt

WORKDIR /src/
#COPY . .

CMD scripts/generate.sh
#CMD /bin/bash
