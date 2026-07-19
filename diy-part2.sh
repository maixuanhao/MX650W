#!/bin/bash
# File name: diy-part2.sh
# Description: Tối ưu hóa chuẩn cho Meraki MX65W (LED, Network, UI)

# 1. THAY ĐỔI ĐỊA CHỈ IP MẶC ĐỊNH SANG 192.168.10.1
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# 2. CẤU HÌNH GIAO DIỆN ARGON VÀ NGÔN NGỮ
echo 'CONFIG_PACKAGE_luci-theme-argon=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-argon-config=y' >> .config
echo 'CONFIG_PACKAGE_luci-i18n-base-vi=y' >> .config
echo 'CONFIG_PACKAGE_luci-i18n-passwall-vi=y' >> .config

# 3. CẤU HÌNH HỆ THỐNG & MENU CORE
echo 'CONFIG_PACKAGE_luci-mod-admin-full=y' >> .config
echo 'CONFIG_PACKAGE_luci-mod-network=y' >> .config
echo 'CONFIG_PACKAGE_luci-mod-status=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-system=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-firewall=y' >> .config

# 4. CẤU HÌNH DRIVER LED (Bắt buộc cho MX65W)
echo 'CONFIG_PACKAGE_kmod-leds-gpio=y' >> .config
echo 'CONFIG_PACKAGE_kmod-ledtrig-netdev=y' >> .config
echo 'CONFIG_PACKAGE_ledtrig-netdev=y' >> .config
echo 'CONFIG_PACKAGE_kmod-ledtrig-timer=y' >> .config
echo 'CONFIG_PACKAGE_kmod-ledtrig-default-on=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-ledtrig-netdev=y' >> .config

# 5. CÁC APP TIỆN ÍCH (Passwall, AdGuard, v.v.)
echo 'CONFIG_PACKAGE_luci-app-ttyd=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-adguardhome=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-passwall=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-ddns=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-mwan3=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-upnp=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-zerotier=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-sqm=y' >> .config

# 6. BỔ SUNG CÁC CÔNG CỤ MẠNG MẠNH MẼ
echo 'CONFIG_PACKAGE_ip-full=y' >> .config
echo 'CONFIG_PACKAGE_curl=y' >> .config
echo 'CONFIG_PACKAGE_coreutils=y' >> .config
echo 'CONFIG_PACKAGE_bash=y' >> .config
