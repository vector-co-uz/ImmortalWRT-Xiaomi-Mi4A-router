#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# Add additional first-boot settings

mkdir -p files/etc/uci-defaults

cp -f "$GITHUB_WORKSPACE/files/99-vector-settings" \
    files/etc/uci-defaults/99-vector-settings
chmod +x files/etc/uci-defaults/99-vector-settings

cp -f "$GITHUB_WORKSPACE/files/40-luci-theme" \
    files/etc/uci-defaults/40-luci-theme
chmod +x files/etc/uci-defaults/40-luci-theme

# Install the lightweight dynamic MOTD and reusable status command.
mkdir -p files/etc/profile.d files/usr/bin
cp -f "$GITHUB_WORKSPACE/files/etc/profile.d/99-router-motd.sh" \
    files/etc/profile.d/99-router-motd.sh
cp -f "$GITHUB_WORKSPACE/files/usr/bin/router-status" \
    files/usr/bin/router-status
chmod +x files/etc/profile.d/99-router-motd.sh files/usr/bin/router-status
