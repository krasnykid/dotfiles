#!/bin/sh
l=$(hyprctl activeworkspace -j | jq -r '.tiledLayout // .tiled_layout // "?"')
printf '{"text":"%s","alt":"%s","tooltip":"%s"}\n' "$l" "$l" "$l"
