#!/bin/bash
#
# Description: Custom DIY script part 2 (After Update feeds)
#

# 1. 注入核心保留插件及依赖环境（EasyTier、AdGuard Home、uPNP）
echo "CONFIG_PACKAGE_kmod-tun=y" >> .config
echo "CONFIG_PACKAGE_luci-app-easytier=y" >> .config
echo "CONFIG_PACKAGE_luci-app-adguardhome=y" >> .config
echo "CONFIG_PACKAGE_luci-app-upnp=y" >> .config

# 2. 彻底屏蔽并移除您不需要的顽固插件（强制关闭编译开关）
# 剔除网络共享 Samba4
sed -i '/CONFIG_PACKAGE_luci-app-samba4/d' .config
sed -i '/CONFIG_PACKAGE_samba4/d' .config
echo "CONFIG_PACKAGE_luci-app-samba4=n" >> .config

# 剔除 OpenSSH SFTP 服务
sed -i '/CONFIG_PACKAGE_openssh-sftp-server/d' .config
echo "CONFIG_PACKAGE_openssh-sftp-server=n" >> .config

# 剔除 异地组网 ZeroTier
sed -i '/CONFIG_PACKAGE_luci-app-zerotier/d' .config
sed -i '/CONFIG_PACKAGE_zerotier/d' .config
echo "CONFIG_PACKAGE_luci-app-zerotier=n" >> .config

# 剔除 上网时间控制 (Access Control)
sed -i '/CONFIG_PACKAGE_luci-app-accesscontrol/d' .config
echo "CONFIG_PACKAGE_luci-app-accesscontrol=n" >> .config

# 剔除 KMS 微软激活服务器 (vlmcsd)
sed -i '/CONFIG_PACKAGE_luci-app-vlmcsd/d' .config
sed -i '/CONFIG_PACKAGE_vlmcsd/d' .config
echo "CONFIG_PACKAGE_luci-app-vlmcsd=n" >> .config

# 剔除 定时重启 (Autoreboot)
sed -i '/CONFIG_PACKAGE_luci-app-autoreboot/d' .config
echo "CONFIG_PACKAGE_luci-app-autoreboot=n" >> .config

# 剔除 WiFi 定时开关 (Wifischedule)
sed -i '/CONFIG_PACKAGE_luci-app-wifischedule/d' .config
echo "CONFIG_PACKAGE_luci-app-wifischedule=n" >> .config
