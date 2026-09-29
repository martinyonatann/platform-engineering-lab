# 1.30 is the current nginx stable series; the floating patch tag (1.30-alpine)
# keeps the base image on a supported Alpine release so security fixes are picked
# up automatically and the Trivy gate in .github/workflows/ci.yaml stays green.
FROM nginx:1.30-alpine

# Pick up security fixes published to the Alpine 3.24 repositories after this
# image tag was built (e.g. libexpat CVE-2026-93990). Keeps the HIGH/CRITICAL
# Trivy gate in .github/workflows/ci.yaml green.
RUN apk upgrade --no-cache

ARG GIT_SHA=dev

COPY index.html /usr/share/nginx/html/index.html
# index.html carries a __GIT_SHA__ placeholder, so replace the whole token.
RUN sed -i "s/__GIT_SHA__/${GIT_SHA}/g" /usr/share/nginx/html/index.html

EXPOSE 80