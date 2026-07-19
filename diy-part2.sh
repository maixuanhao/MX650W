#!/bin/bash
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (Tối ưu hóa cho Meraki MR30H)

# =================================================================
# 1. THAY ĐỔI ĐỊA CHỈ IP MẶC ĐỊNH SANG 192.168.10.1
# =================================================================
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# =================================================================
# 2. CẤU HÌNH GIAO DIỆN VÀ NGÔN NGỮ TIẾNG VIỆT MẶC ĐỊNH
# =================================================================
echo 'CONFIG_LUCI_LANG_vi=y' >> .config
echo 'CONFIG_PACKAGE_luci-theme-argon=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-argon-config=y' >> .config
echo 'CONFIG_PACKAGE_luci-i18n-argon-config-vi=y' >> .config
echo 'CONFIG_PACKAGE_luci-i18n-base-vi=y' >> .config

# =================================================================
# 3. ÉP HỆ THỐNG GIỮ LẠI CÁC MENU CORE GỐC CHO MR30H
# =================================================================
echo 'CONFIG_PACKAGE_luci-mod-admin-full=y' >> .config
echo 'CONFIG_PACKAGE_luci-mod-network=y' >> .config
echo 'CONFIG_PACKAGE_luci-mod-status=y' >> .config

# =================================================================
# 4. BỔ SUNG CÁC APP TIỆN ÍCH PHÙ HỢP CẤU HÌNH PHẦN CỨNG MR30H
# =================================================================
echo 'CONFIG_PACKAGE_luci-app-ttyd=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-adguardhome=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-passwall=y' >> .config
echo 'CONFIG_PACKAGE_luci-i18n-passwall-vi=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-ddns=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-mwan3=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-upnp=y' >> .config
