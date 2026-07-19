#!/bin/bash
# File name: diy-part2.sh
# Tối ưu hóa chuẩn cho Meraki MX65W

# 1. THAY ĐỔI ĐỊA CHỈ IP MẶC ĐỊNH
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# 2. ÉP CẤU HÌNH PHẦN CỨNG (Quan trọng để build đúng thiết bị)
echo 'CONFIG_TARGET_bcm53xx=y' >> .config
echo 'CONFIG_TARGET_bcm53xx_generic=y' >> .config
echo 'CONFIG_TARGET_bcm53xx_generic_DEVICE_meraki_mx65w=y' >> .config

# 3. GIAO DIỆN ARGON VÀ TIẾNG VIỆT
echo 'CONFIG_PACKAGE_luci-theme-argon=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-argon-config=y' >> .config
echo 'CONFIG_PACKAGE_luci-i18n-base-vi=y' >> .config
echo 'CONFIG_PACKAGE_luci-i18n-passwall-vi=y' >> .config

# 4. DRIVER LED (Để đèn LAN/WAN hoạt động)
echo 'CONFIG_PACKAGE_kmod-leds-gpio=y' >> .config
echo 'CONFIG_PACKAGE_kmod-ledtrig-netdev=y' >> .config
echo 'CONFIG_PACKAGE_kmod-ledtrig-timer=y' >> .config
echo 'CONFIG_PACKAGE_kmod-ledtrig-default-on=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-ledtrig-netdev=y' >> .config

# 5. CÁC APP TIỆN ÍCH
echo 'CONFIG_PACKAGE_luci-app-passwall=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-adguardhome=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-ttyd=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-mwan3=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-ddns=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-upnp=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-zerotier=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-sqm=y' >> .config

# 6. CÔNG CỤ HỆ THỐNG
echo 'CONFIG_PACKAGE_ip-full=y' >> .config
echo 'CONFIG_PACKAGE_curl=y' >> .config
echo 'CONFIG_PACKAGE_coreutils=y' >> .config
echo 'CONFIG_PACKAGE_bash=y' >> .config
