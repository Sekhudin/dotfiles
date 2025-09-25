# extra for bash and zsh

if command -v fastfetch >/dev/null 2>&1; then
  fastfetch
fi

if command -v wps >/dev/null 2>&1; then
  alias 'wps:open'='nohup wps >/dev/null 2>&1 & disown'
fi
