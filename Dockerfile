FROM n8nio/n8n:latest

# Install python3 and set up virtual environment for pipx
USER root
RUN apk add --no-cache python3 py3-pip && \
    python3 -m venv /opt/pipx && \
    /opt/pipx/bin/pip install pipx

USER node
ENV PATH="/opt/pipx/bin:$PATH"