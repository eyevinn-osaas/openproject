FROM openproject/openproject:15-slim

USER root
COPY osc-entrypoint.sh /usr/local/bin/osc-entrypoint.sh
RUN chmod +x /usr/local/bin/osc-entrypoint.sh

USER app

VOLUME ["$APP_DATA_PATH"]

ENTRYPOINT ["/usr/local/bin/osc-entrypoint.sh"]
CMD ["/app/docker/prod/web"]
