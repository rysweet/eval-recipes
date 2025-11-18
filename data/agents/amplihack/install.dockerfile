# Claude Code is already installed in base.dockerfile  

# Clone amplihack and copy .claude/ context
RUN git clone --depth 1 --branch feat/issue-1406-containerized-mode https://github.com/rysweet/MicrosoftHackathon2025-AgenticCoding.git /tmp/amplihack && \
    mkdir -p /project/.claude && \
    cp -r /tmp/amplihack/.claude/* /project/.claude/ && \
    rm -rf /tmp/amplihack
