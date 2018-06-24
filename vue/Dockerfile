FROM node:8

ADD ./runall.sh /opt/runall.sh
WORKDIR /data/crm_docker/httpdocs_vue
RUN chmod 744 /opt/runall.sh

ENTRYPOINT ["/opt/runall.sh"]

