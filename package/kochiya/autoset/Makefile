#
# Copyright (C) 2016-2017 GitHub 
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=autoset
PKG_VERSION:=2.0
PKG_RELEASE:=0
PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/autoset
  SECTION:=luci
  CATEGORY:=LuCI
  TITLE:=LuCI support for Sets
  PKGARCH:=all
  DEPENDS:=+@LUCI_LANG_zh-cn +luci +luci-theme-material
endef

define Package/autoset/description
	Language Support Packages.
endef

define Build/Prepare
	$(foreach po,$(wildcard ${CURDIR}/i18n/*.po), \
		po2lmo $(po) $(PKG_BUILD_DIR)/$(patsubst %.po,%.lmo,$(notdir $(po)));)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/autoset/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_DIR) $(1)/www
#	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/*.lmo $(1)/usr/lib/lua/luci/i18n/
	$(INSTALL_BIN) ./files/zzz-autoset $(1)/etc/uci-defaults/99-autoset
	$(INSTALL_DATA) ./files/updatelog.txt $(1)/www/updatelog.txt
#	$(INSTALL_BIN) ./files/nand-overlay $(1)/etc/init.d/init-nand-flash
endef

$(eval $(call BuildPackage,autoset))
