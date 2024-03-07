# QUIC
echo -e '#QUIC\nnet.core.rmem_max=4194304\nnet.core.wmem_max=4194304' > openwrt/package/base-files/files/etc/sysctl.d/20-net-core-mem-max.conf
