# QUIC
echo -e '#QUIC\nnet.core.rmem_max=4194304\nnet.core.wmem_max=4194304' > openwrt/package/base-files/files/etc/sysctl.d/20-net-core-mem-max.conf

# Default network segment
sed -i 's/192.168.1.1/192.168.99.1/g' package/base-files/files/bin/config_generate

# Delete ula prefix
sed -i 's/network.globals.ula_prefix=\'auto\'/network.globals.ula_prefix=\'\'/g' package/base-files/files/bin/config_generate
