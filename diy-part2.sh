#!/bin/bash
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)

# =================================================================
# 0. CẤU HÌNH ĐÈN LED TÍN HIỆU CHO CISCO MERAKI MX65W
# =================================================================
mkdir -p files/etc/uci-defaults
cat << 'EOF' > files/etc/uci-defaults/99-custom-leds
#!/bin/sh
# Đèn Nguồn mặc định sáng ổn định
LED_POWER=$(ls /sys/class/leds/ | grep -E "blue|green" | head -n 1)
if [ -n "$LED_POWER" ]; then
    uci -q delete system.led_power
    uci set system.led_power=led
    uci set system.led_power.name='Power LED'
    uci set system.led_power.sysfs="$LED_POWER"
    uci set system.led_power.trigger='default-on'
fi

# Tự động map tín hiệu mạng (netdev) vào toàn bộ bóng LED LAN/WAN trước và sau máy
for led in $(ls /sys/class/leds/ | grep -E "lan|wan|port|link|speed"); do
    uci -q delete system.led_$led
    uci set system.led_$led=led
    uci set system.led_$led.name="LED_$led"
    uci set system.led_$led.sysfs="$led"
    uci set system.led_$led.trigger='netdev'
    uci set system.led_$led.dev='eth0'
    uci set system.led_$led.mode='link tx rx'
done

uci commit system
/etc/init.d/led restart
exit 0
EOF
chmod +x files/etc/uci-defaults/99-custom-leds

# =================================================================
# 1. GIAO DIỆN ARGON & NGÔN NGỮ TIẾNG VIỆT MẶC ĐỊNH
# =================================================================
echo 'CONFIG_LUCI_LANG_vi=y' >> .config
echo 'CONFIG_PACKAGE_luci-theme-argon=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-argon-config=y' >> .config
echo 'CONFIG_PACKAGE_luci-i18n-argon-config-vi=y' >> .config
echo 'CONFIG_PACKAGE_luci-i18n-base-vi=y' >> .config

# =================================================================
# 2. GIÁM SÁT HỆ THỐNG & TIỆN ÍCH PHẦN CỨNG (RAM 2GB / CPU)
# =================================================================
echo 'CONFIG_PACKAGE_luci-app-netdata=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-ttyd=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-cpufreq=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-irqbalance=y' >> .config

# =================================================================
# 3. ẢO HÓA DOCKER
# =================================================================
echo 'CONFIG_PACKAGE_luci-app-dockerman=y' >> .config
echo 'CONFIG_PACKAGE_luci-i18n-dockerman-vi=y' >> .config
echo 'CONFIG_PACKAGE_docker-compose=y' >> .config

# =================================================================
# 4. TỐI ƯU MẠNG & CHẶN QUẢNG CÁO
# =================================================================
echo 'CONFIG_PACKAGE_luci-app-upnp=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-adguardhome=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-access-control=y' >> .config
echo 'CONFIG_PACKAGE_luci-i18n-access-control-vi=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-ddns=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-mwan3=y' >> .config

# =================================================================
# 5. CÁC APP ĐỊNH TUYẾN & VPN NÂNG CAO (Bypass / Proxy)
# =================================================================
echo 'CONFIG_PACKAGE_luci-app-wireguard=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-openvpn=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-v2ray=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-openclash=y' >> .config
echo 'CONFIG_PACKAGE_luci-i18n-openclash-vi=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-passwall=y' >> .config
echo 'CONFIG_PACKAGE_luci-i18n-passwall-vi=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-tailscale=y' >> .config

# =================================================================
# 6. LƯU TRỮ NAS & ĐA PHƯƠNG TIỆN
# =================================================================
echo 'CONFIG_PACKAGE_luci-app-samba4=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-ksmbd=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-aria2=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-hd-idle=y' >> .config
# Thêm các gói bổ trợ vào cấu hình trước khi build
sed -i '$a CONFIG_PACKAGE_luci-app-firewall=y' .config
sed -i '$a CONFIG_PACKAGE_luci-app-statistics=y' .config
sed -i '$a CONFIG_PACKAGE_luci-app-ledtrig-netdev=y' .config
sed -i '$a CONFIG_PACKAGE_luci-app-attendedsysupgrade=y' .config
echo 'CONFIG_PACKAGE_luci-app-minidlna=y' >> .config

# Thay đổi IP mặc định sang 192.168.10.1
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
