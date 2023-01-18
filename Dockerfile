FROM alpine:3.16

ENV HOME=/tekton/home \
    USER_UID=65532 \
    USER_GID=65532

RUN apk add --no-cache ca-certificates=20220614-r0 openssh-client==9.0_p1-r2 && \
    adduser -h ${HOME} -s /bin/nologin -D -u ${USER_UID} -g ${USER_GID} tekton && \
    mkdir -p ${HOME}/.ssh && \
    chown -R ${USER_UID}:${USER_GID} ${HOME}

USER ${USER_UID}
