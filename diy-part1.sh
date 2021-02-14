#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)

# 配置自定义主题
#
# > 清除旧版argon主题并拉取最新版
rm -rf package/lean/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/community/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config package/community/luci-app-argon-config
#
# > 修改默认主题为 Argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
#
# > AdguardHome
git clone https://github.com/rufengsuixing/luci-app-adguardhome package/community/luci-app-adguardhome
# > HelloWorld (vssr)
git clone https://github.com/jerrykuku/lua-maxminddb package/community/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr package/community/luci-app-vssr

# Uncomment a feed source
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
sed -i '$a src-git lienol https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default
sed -i '$a src-git jerryk https://github.com/jerrykuku/openwrt-package' feeds.conf.default
# sed -i '$a src-git adguardhome https://github.com/rufengsuixing/luci-app-adguardhome' feeds.conf.default
sed -i '$a src-git lede https://github.com/coolsnowwolf/openwrt-package' feeds.conf.default
