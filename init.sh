#!/bin/bash

set -e

REPO="WangeSpyAI/devcontainer-templates"
BRANCH="main"
LANG=${1:-}

if [ -z "$LANG" ]; then
  echo "Usage: init.sh <language>"
  echo "Example: init.sh python"
  exit 1
fi

URL="https://raw.githubusercontent.com/$REPO/$BRANCH/$LANG/.devcontainer.json"

if ! curl -fsSL "$URL" -o .devcontainer.json; then
  echo "❌ テンプレートが見つかりませんでした: $LANG"
  exit 1
fi

echo "✅ .devcontainer.json をコピーしました（$LANG）"