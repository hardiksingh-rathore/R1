################################################################################
#
# rtl8723bu
#
################################################################################

RTL8723BU_VERSION = "master"
RTL8723BU_SITE = $(call github,lwfinger,rtl8723bu,$(RTL8723BU_VERSION))
RTL8723BU_LICENSE = GPLv2, proprietary (rtl8723b_fw.bin firmware blob)
RTL8723BU_LICENSE_FILES = COPYING
RTL8723BU_MODULE_MAKE_OPTS = CONFIG_RTL8723BU=m

$(eval $(kernel-module))

define RTL8723BU_INSTALL_FIRMWARE
	$(INSTALL) -D -m 644 $(@D)/rtl8723b_fw.bin \
		$(TARGET_DIR)/lib/firmware/rtlwifi/rtl8723b_fw.bin
endef
RTL8723BU_POST_INSTALL_TARGET_HOOKS += RTL8723BU_INSTALL_FIRMWARE

$(eval $(generic-package))
