# QUIC
echo -e '#QUIC\nnet.core.rmem_max=4194304\nnet.core.wmem_max=4194304' > openwrt/package/base-files/files/etc/sysctl.d/20-net-core-mem-max.conf

# NGINX
sed -i 's/large_client_header_buffers 2 1k/large_client_header_buffers 4 32k/g' openwrt/feeds/packages/net/nginx-util/files/uci.conf.template
sed -i 's/client_max_body_size 128M/client_max_body_size 2048M/g' openwrt/feeds/packages/net/nginx-util/files/uci.conf.template
sed -i '/client_max_body_size/a\\tclient_body_buffer_size 8192M;' openwrt/feeds/packages/net/nginx-util/files/uci.conf.template
sed -i '/client_max_body_size/a\\tserver_names_hash_bucket_size 128;' openwrt/feeds/packages/net/nginx-util/files/uci.conf.template
sed -i '/ubus_parallel_req/a\        ubus_script_timeout 600;' openwrt/feeds/packages/net/nginx/files-luci-support/60_nginx-luci-support
sed -ri '/luci-webui.socket/i\ \t\tuwsgi_send_timeout 600\;\n\t\tuwsgi_connect_timeout 600\;\n\t\tuwsgi_read_timeout 600\;' openwrt/feeds/packages/net/nginx/files-luci-support/luci.locations
sed -ri '/luci-cgi_io.socket/i\ \t\tuwsgi_send_timeout 600\;\n\t\tuwsgi_connect_timeout 600\;\n\t\tuwsgi_read_timeout 600\;' openwrt/feeds/packages/net/nginx/files-luci-support/luci.locations

# Default network segment
sed -i 's/192.168.1.1/192.168.99.1/g' openwrt/package/base-files/files/bin/config_generate

# Modify default settings
sed -i '$i uci set luci.sauth.sessiontime=\x270\x27' openwrt/package/emortal/default-settings/files/99-default-settings-chinese
sed -i '$i uci commit luci\n' openwrt/package/emortal/default-settings/files/99-default-settings-chinese
