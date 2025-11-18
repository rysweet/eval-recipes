# Claude Code is already installed in base.dockerfile

# Clone eval-recipes for settings, amplihack ultrathink-default branch for context
RUN git clone --depth 1 https://github.com/microsoft/eval-recipes.git /tmp/eval-recipes && \
    git clone --depth 1 --branch feat/issue-1405-ultrathink-default https://github.com/rysweet/MicrosoftHackathon2025-AgenticCoding.git /tmp/amplihack && \
    mkdir -p /project/.claude && \
    cp -r /tmp/amplihack/.claude/* /project/.claude/ && \
    cp /tmp/eval-recipes/.claude/settings.json /project/.claude/settings.json && \
    rm -rf /tmp/amplihack /tmp/eval-recipes
