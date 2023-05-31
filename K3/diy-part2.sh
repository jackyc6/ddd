#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

echo '定制编译K3'
sed -i '421,453d' target/linux/bcm53xx/image/Makefile
sed -i '140,412d' target/linux/bcm53xx/image/Makefile
cat target/linux/bcm53xx/image/Makefile |grep DEVICE_PACKAGES
echo '========special for K3!========'

echo '定制K3主机名'
sed -i "s/hostname='OpenWrt'/hostname='Phicomm-K3'/g" package/base-files/files/bin/config_generate
cat package/base-files/files/bin/config_generate |grep hostname=
echo '=========Rewrite hostname done!========='

#download apk
git clone -b luci https://github.com/xiaorouji/openwrt-passwall.git package/lucipc
git clone https://github.com/destan19/OpenAppFilter.git package/oneapp
git clone https://github.com/xnxy2012/k3screenctrl.git package/k3screenctrl
git clone https://github.com/lwz322/k3screenctrl_build.git package/k3screenctrl_build
git clone https://github.com/lwz322/luci-app-k3screenctrl.git package/luci-app-k3screenctrl
