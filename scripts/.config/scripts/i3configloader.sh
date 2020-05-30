#!/bin/bash
include_path="$HOME/.i3/include/"
i3_config="$HOME/.i3/config"

rm -f "$i3_config"
for f in "${include_path}"*.config
do
    cat "${f}" >> "${i3_config}"
done
