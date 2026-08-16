FROM node:22-bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
      git ripgrep ca-certificates less jq curl gpg \
 && rm -rf /var/lib/apt/lists/*

RUN install -d -m 0755 /etc/apt/keyrings \
 && curl -fsSL https://downloads.claude.ai/keys/claude-code.asc \
      -o /etc/apt/keyrings/claude-code.asc \
 && echo "deb [signed-by=/etc/apt/keyrings/claude-code.asc] https://downloads.claude.ai/claude-code/apt/stable stable main" \
      > /etc/apt/sources.list.d/claude-code.list \
 && apt-get update && apt-get install -y --no-install-recommends claude-code \
 && rm -rf /var/lib/apt/lists/*

RUN userdel -r node \
 && useradd -m -u 1000 -s /bin/bash dev \
 && mkdir -p /home/dev/.claude \
 && chown -R dev:dev /home/dev

USER dev
WORKDIR /work

ENV HTTPS_PROXY=http://claude-proxy:3128 \
    HTTP_PROXY=http://claude-proxy:3128 \
    https_proxy=http://claude-proxy:3128 \
    http_proxy=http://claude-proxy:3128 \
    NO_PROXY=localhost,127.0.0.1 \
    no_proxy=localhost,127.0.0.1 \
    CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1 \
    DISABLE_AUTOUPDATER=1 \
    ENABLE_CLAUDEAI_MCP_SERVERS=false

CMD ["bash"]
