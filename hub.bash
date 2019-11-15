#!/usr/bin/env bash
set -xeou pipefail

wget https://github.com/github/hub/releases/download/v2.13.0/hub-linux-amd64-2.13.0.tgz
tar -xzvf $(basename "$_")
rm -r $_
mkdir /opt/ni_tools/hub
mv hub-linux-*/bin/hub $_
rm -r  hub-linux-*/
