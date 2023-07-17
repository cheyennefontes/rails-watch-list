#!/bin/bash
set -e

# Remover server.pid pré-existente para rails
rm -f /rails-watch-list/tmp/pids/server.pid

# Executar processo principal do container (cmd dockerfile)
exec "$@"
