#!/bin/bash

# Modify default IP
sed -i 's/192.168.1.1/192.168.99.2/g' package/base-files/files/bin/config_generate

git clone https://github.com/ophub/luci-app-amlogic.git package/luci-app-amlogic

# ==========openclash===========
cd package
git clone --depth=1 --filter=blob:none --sparse https://github.com/vernesong/OpenClash.git
cd OpenClash
git sparse-checkout set luci-app-openclash
cd ../..

#readd cpufreq for aarch64
#sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' package/lean/luci-app-cpufreq/Makefile
#sed -i 's/services/system/g'  package/lean/luci-app-cpufreq/luasrc/controller/cpufreq.lua
