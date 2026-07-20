#!/bin/bash
# 1. Đặt IP mặc định cho Router
sed -i 's/192.168.1.1/192.168.1.1/g' package/base-files/files/bin/config_generate

# 2. Đặt giao diện Argon và Tiếng Việt làm mặc định
uci set luci.main.mediaurlbase='/luci-static/argon' 2>/dev/null || true
uci set luci.main.lang='vi' 2>/dev/null || true
