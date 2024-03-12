# QUIC
echo -e ＂#QUIC\nnet.core.rmem_max=4194304\nnet.core.wmem_max=4194304＂ > openwrt/package/base-files/files/etc/sysctl.d/20-net-core-mem-max.conf

# Default network segment
sed -i ＂s/192.168.1.1/192.168.99.1/g＂ openwrt/package/base-files/files/bin/config_generate

# Delete ula prefix
sed -i ＂s/network.globals.ula_prefix=\'auto\'/network.globals.ula_prefix=\'\'/g＂ openwrt/package/base-files/files/bin/config_generate

# Modify default settings
sed -i ＂$i uci set luci.sauth.sessiontime=\'0\'＂ openwrt/package/emortal/default-settings/files/99-default-settings-chinese
sed -i ＂$i uci commit luci\n＂ openwrt/package/emortal/default-settings/files/99-default-settings-chinese
