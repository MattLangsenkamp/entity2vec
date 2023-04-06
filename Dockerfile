FROM deepjavalibrary/djl-serving:0.19.0-pytorch-cu113

COPY . .

ENV SDKMAN_DIR /root/.sdkman

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update
RUN apt-get install -y zip unzip curl
RUN curl -s "https://get.sdkman.io" | bash
RUN chmod a+x "$SDKMAN_DIR/bin/sdkman-init.sh"

RUN source "$HOME/.sdkman/bin/sdkman-init.sh"
RUN source /root/.bashrc
RUN source "$SDKMAN_DIR/bin/sdkman-init.sh" && sdk install scala 3.2.2
RUN source "$SDKMAN_DIR/bin/sdkman-init.sh" && sdk install java 22.3.r19-grl
RUN source "$SDKMAN_DIR/bin/sdkman-init.sh" && sdk install sbt 1.8.2
RUN source "$SDKMAN_DIR/bin/sdkman-init.sh" && sbt clean compile

CMD ["$SDKMAN_DIR/bin/sdkman-init.sh", "&&", "sbt", "run"]