# QUIC
echo -e '#QUIC\nnet.core.rmem_max=4194304\nnet.core.wmem_max=4194304' > openwrt/package/base-files/files/etc/sysctl.d/20-net-core-mem-max.conf

# Default network segment
sed -i 's/192.168.1.1/192.168.99.1/g' openwrt/package/base-files/files/bin/config_generate

# Modify default settings
sed -i '$i uci set luci.sauth.sessiontime=\x270\x27' openwrt/package/emortal/default-settings/files/99-default-settings-chinese
sed -i '$i uci commit luci' openwrt/package/emortal/default-settings/files/99-default-settings-chinese
sed -i '$i uci delete network.globals.ula_prefix' openwrt/package/emortal/default-settings/files/99-default-settings-chinese
sed -i '$i uci commit network' openwrt/package/emortal/default-settings/files/99-default-settings-chinese
sed -i '$i uci set firewall.@defaults[0].flow_offloading_hw=\x270\x27' openwrt/package/emortal/default-settings/files/99-default-settings-chinese
sed -i '$i uci commit firewall' openwrt/package/emortal/default-settings/files/99-default-settings-chinese

mkdir -p openwrt/package/new
git clone -b main --depth 1 https://github.com/jasonwei23/pkg.git openwrt/package/new
