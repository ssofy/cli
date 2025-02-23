#!/bin/bash

set -e

URL_PREFIX="https://raw.githubusercontent.com/ssofy/cli/master/bin"
INSTALL_DIR="$PWD"

case "$(uname -sm)" in
  "Darwin x86_64") FILENAME="ssofy-darwin-amd64" ;;
  "Darwin arm64") FILENAME="ssofy-darwin-arm64" ;;
  "Linux x86_64") FILENAME="ssofy-linux-amd64" ;;
  "Linux i686") FILENAME="ssofy-linux-386" ;;
  "Linux armv7l") FILENAME="ssofy-linux-arm" ;;
  "Linux aarch64") FILENAME="ssofy-linux-arm64" ;;
  *) echo "Unsupported architecture: $(uname -sm)" >&2; exit 1 ;;
esac

echo "Downloading $FILENAME from github releases"
if ! curl -sSLf "$URL_PREFIX/$FILENAME" -o "$INSTALL_DIR/ssofy"; then
  echo "Failed to write to $INSTALL_DIR; please ensure $INSTALL_DIR exists and is writable" >&2
  exit 1
fi

if ! chmod +x "$INSTALL_DIR/ssofy"; then
  echo "Failed to set executable permission on $INSTALL_DIR/ssofy" >&2
  exit 1
fi

echo "SSOfy dev cli is successfully installed. Make sure '$INSTALL_DIR' is in your PATH."
