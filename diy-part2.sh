#!/bin/bash
# Xóa cấu hình cũ để tránh xung đột
rm -f .config

# 1. Đổi IP mặc định
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# 2. Ép cấu hình phần cứng MX65W
echo 'CONFIG_TARGET_bcm53xx=y' >> .config
echo 'CONFIG_TARGET_bcm53xx_generic=y' >> .config
echo 'CONFIG_TARGET_bcm53xx_generic_DEVICE_meraki_mx65w=y' >> .config

# 3. Giao diện và Ngôn ngữ
echo 'CONFIG_PACKAGE_luci-theme-argon=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-argon-config=y' >> .config
echo 'CONFIG_PACKAGE_luci-i18n-base-vi=y' >> .config
echo 'CONFIG_PACKAGE_luci-i18n-passwall-vi=y' >> .config

# 4. Driver LED (Quan trọng cho MX65W)
echo 'CONFIG_PACKAGE_kmod-leds-gpio=y' >> .config
echo 'CONFIG_PACKAGE_kmod-ledtrig-netdev=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-ledtrig-netdev=y' >> .config

# 5. Các App cần thiết
echo 'CONFIG_PACKAGE_luci-app-passwall=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-adguardhome=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-ttyd=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-mwan3=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-ddns=y' >> .config

# 6. Công cụ hệ thống
echo 'CONFIG_PACKAGE_ip-full=y' >> .config
echo 'CONFIG_PACKAGE_curl=y' >> .config
echo 'CONFIG_PACKAGE_coreutils=y' >> .config
