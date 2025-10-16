FROM amazoncorretto:21-alpine3.22

ARG USERNAME='app'
ARG UID=1000

RUN apk update && apk upgrade \
  && apk add --no-cache 'bash' 'curl' 'git' 'openssh-client' 'starship' \
  && rm -fr '/var/cache/apk/*' \
  && addgroup -g "${UID}" "${USERNAME}" \
  && adduser -u "${UID}" -G "${USERNAME}" -h "/home/${USERNAME}" -s '/bin/bash' -D "${USERNAME}" \
  && echo 'eval "$(starship init bash)"' >> "/home/${USERNAME}/.bashrc"

USER "${USERNAME}"

WORKDIR '/app'
