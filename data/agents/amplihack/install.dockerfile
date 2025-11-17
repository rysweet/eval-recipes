# Claude Code is already installed in base.dockerfile

# Clone amplihack repo and copy .claude/ context to /project
RUN git clone --depth 1 https://github.com/rysweet/MicrosoftHackathon2025-AgenticCoding.git /tmp/amplihack && \
    mkdir -p /project/.claude && \
    cp -r /tmp/amplihack/.claude/* /project/.claude/ && \
    rm -rf /tmp/amplihack
