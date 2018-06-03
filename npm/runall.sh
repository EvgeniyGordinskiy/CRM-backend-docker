#!/bin/sh

echo "Running /data/crm_docker/httpdocs_node/ "
cd "/data/crm_docker/httpdocs_node/"
npm install
npm run dev
