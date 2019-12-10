#!/usr/bin/env bash
set -xeou pipefail
source paths.bash

wget https://github.com/github/hub/releases/download/v2.13.0/hub-linux-amd64-2.13.0.tgz
tar -xzvf $(basename "$_")
rm -r $_
mkdir $NI/hub
mv hub-linux-*/bin/hub $_
rm -r  hub-linux-*/
