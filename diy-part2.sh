#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 1. Đổi IP mặc định sang dải cấu hình Meraki (192.168.65.1)
sed -i 's/192.168.1.1/192.168.65.1/g' package/base-files/files/bin/config_generate

# 2. Tự động đổi tên router thành Meraki-MX65W
sed -i 's/OpenWrt/Meraki-MX65W/g' package/base-files/files/bin/config_generate

# 3. Tự động đổi giao diện mặc định sang Argon (Giao diện rất đẹp của ImmortalWrt)
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
