# QUIC
echo -e '#QUIC\nnet.core.rmem_max=4194304\nnet.core.wmem_max=4194304' > openwrt/package/base-files/files/etc/sysctl.d/20-net-core-mem-max.conf

cp -rf lrng_v52_6.1/* openwrt/target/linux/generic/hack-6.1/
echo '
# CONFIG_RANDOM_DEFAULT_IMPL is not set
CONFIG_LRNG=y
# CONFIG_LRNG_IRQ is not set
CONFIG_LRNG_JENT=y
CONFIG_LRNG_CPU=y
# CONFIG_LRNG_SCHED is not set
' >> openwrt/target/linux/generic/config-6.1
