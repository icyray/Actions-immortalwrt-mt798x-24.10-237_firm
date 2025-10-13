#!/bin/bash

# git clone -b 2410 --single-branch --filter=blob:none https://github.com/padavanonly/immortalwrt-mt798x-24.10 immortalwrt-mt798x-24.10
# cd immortalwrt-mt798x-24.10

# git config --local https.proxy socks5://host.docker.internal:1080

# ./scripts/feeds update -a
# ./scripts/feeds install -a

# theme
rm -rf feeds/luci/themes/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

# passwall
rm -rf feeds/packages/net/{xray-core,v2ray-geodata,sing-box,chinadns-ng,dns2socks,hysteria,ipt2socks,microsocks,naiveproxy,shadowsocks-libev,shadowsocks-rust,shadowsocksr-libev,simple-obfs,tcping,trojan-plus,tuic-client,v2ray-plugin,xray-plugin,geoview,shadow-tls}
git clone https://github.com/xiaorouji/openwrt-passwall-packages package/passwall-packages

rm -rf feeds/luci/applications/luci-app-passwall
# git clone https://github.com/xiaorouji/openwrt-passwall package/passwall-luci
git clone https://github.com/xiaorouji/openwrt-passwall2 package/passwall2-luci

# ssr-plus
# rm -rf package/helloworld
# git clone --depth=1 https://github.com/fw876/helloworld.git package/helloworldd
# git -C package/helloworld pull

# mosdns
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 25.x feeds/packages/lang/golang
rm -rf feeds/packages/net/mosdns
git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns

# tailscale
sed -i '/\/etc\/init\.d\/tailscale/d;/\/etc\/config\/tailscale/d;' feeds/packages/net/tailscale/Makefile
git clone https://github.com/asvow/luci-app-tailscale package/luci-app-tailscale

# easytier
git clone https://github.com/EasyTier/luci-app-easytier package/luci-app-easytier

# defconfig
# cp -f ../.config .config
# cp -f defconfig/mt7981-ax3000.config .config
sed -i 's|IMG_PREFIX:=|IMG_PREFIX:=$(shell TZ="Asia/Shanghai" date +"%Y%m%d")-24.10-5.4-|' include/image.mk
# make menuconfig

# compile and build
# make download -j8
# make -j$(nproc)