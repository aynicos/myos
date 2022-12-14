FROM danger89/xfcevdi_x2go as dist
LABEL maintainer aynic.os <support+docker@asycn.io>
ARG DOCKER_BUILD_DIR
ARG DOCKER_GID

RUN apt-get update \
 && apt-get -fy upgrade \
 && apt-get -fy install \
    docker.io \
    ecryptfs-utils \
    fail2ban \
    iptables \
    less \
    libpam-script \
    neovim \
    python3-pip \
    sudo \
 && pip install ssh-crypt \
 && apt-get clean \
 && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN [ "$DOCKER_GID" -eq "$DOCKER_GID" ] 2>/dev/null \
 && if [ "$(getent group docker |awk -F: '{print $3}')" != "$DOCKER_GID" ]; then \
      sed -i 's/^docker:x:[0-9]\+:/docker:x:'$DOCKER_GID':/' /etc/group; \
    fi \
|| true


RUN cp /usr/share/doc/libpam-script/examples/logscript /usr/share/libpam-script \
 && sed -i 's/LOGFILE=\/tmp/LOGFILE=\/var\/log/' /usr/share/libpam-script/logscript \
 && for script in auth acct passwd ses_open ses_close; do \
      ln -s /usr/share/libpam-script/logscript "/usr/share/libpam-script/pam_script_${script}"; \
    done \
 && ln -s /usr/share/libpam-script /etc/pam-script

COPY ${DOCKER_BUILD_DIR}/*.sh /app/
COPY ${DOCKER_BUILD_DIR}/issue.net /etc/
COPY ${DOCKER_BUILD_DIR}/rc*.sh /etc/profile.d/
COPY ${DOCKER_BUILD_DIR}/.*aliases ${DOCKER_BUILD_DIR}/.*profile ${DOCKER_BUILD_DIR}/.*rc /etc/skel/
WORKDIR /app

ARG SSH_PORT=22
CMD []
ENTRYPOINT ["/app/run.sh"]
EXPOSE ${SSH_PORT:-22}
RUN echo "${SSH_PORT}" > /app/.ssh_port
HEALTHCHECK CMD timeout 1 bash -c "</dev/tcp/localhost/$(cat /app/.ssh_port 2>/dev/null)" 2>/dev/null

FROM dist as master
ARG DOCKER_BUILD_DIR
