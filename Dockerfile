FROM felddy/foundryvtt:13

# Force the container to run as the root user to match Railway's volume ownership.
USER root

ARG FOUNDRY_PASSWORD
ARG FOUNDRY_USERNAME
ARG FOUNDRY_VERSION=13.348 

EXPOSE 30000/TCP

ENTRYPOINT ["./entrypoint.sh"]
# Update the dataPath to point to the subdirectory where your old data is.
CMD ["resources/app/main.mjs", "--port=30000", "--headless", "--noupdate", "--dataPath=/data/Data"]
HEALTHCHECK --start-period=3m --interval=30s --timeout=5s CMD ./check_health.sh
