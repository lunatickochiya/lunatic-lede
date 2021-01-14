/*
 *  Based on TP-LINK TL-WR703N/TL-MR10U board support
 *
 *  Copyright (C) 2021 lunatickochiya <125438787@qq.com>
 *  Copyright (C) 2011-2012 Gabor Juhos <juhosg@openwrt.org>
 *
 *  This program is free software; you can redistribute it and/or modify it
 *  under the terms of the GNU General Public License version 2 as published
 *  by the Free Software Foundation.
 */

#include <linux/gpio.h>

#include <asm/mach-ath79/ath79.h>

#include "dev-eth.h"
#include "dev-gpio-buttons.h"
#include "dev-leds-gpio.h"
#include "dev-m25p80.h"
#include "dev-usb.h"
#include "dev-wmac.h"
#include "machtypes.h"

#define HUALU_GPIO_LED_SYSTEM	0
#define HUALU_GPIO_BTN_RESET	12


#define HUALU_KEYS_POLL_INTERVAL	20	/* msecs */
#define HUALU_KEYS_DEBOUNCE_INTERVAL	(3 * HUALU_KEYS_POLL_INTERVAL)

static const char *hualu_part_probes[] = {
	"tp-link",
	NULL,
};

static struct flash_platform_data hualu_flash_data = {
	.part_probes	= hualu_part_probes,
};

static struct gpio_led hualu_leds_gpio[] __initdata = {
	{
		.name		= "hualu-wifi-dock:blue:system",
		.gpio		= HUALU_GPIO_LED_SYSTEM,
		.active_low	= 0,
	},
};

static struct gpio_keys_button hualu_gpio_keys[] __initdata = {
	{
		.desc		= "reset",
		.type		= EV_KEY,
		.code		= KEY_RESTART,
		.debounce_interval = HUALU_KEYS_DEBOUNCE_INTERVAL,
		.gpio		= HUALU_GPIO_BTN_RESET,
		.active_low	= 0,
	}
};

static void __init hualu_setup(void)
{
	u8 *mac = (u8 *) KSEG1ADDR(0x1f01fc00);
	u8 *ee = (u8 *) KSEG1ADDR(0x1fff1000);

	/* disable PHY_SWAP and PHY_ADDR_SWAP bits */
	ath79_setup_ar933x_phy4_switch(false, false);

	ath79_register_m25p80(&hualu_flash_data);
	ath79_register_leds_gpio(-1, ARRAY_SIZE(hualu_leds_gpio),
				 hualu_leds_gpio);
	ath79_register_gpio_keys_polled(-1, HUALU_KEYS_POLL_INTERVAL,
					ARRAY_SIZE(hualu_gpio_keys),
					hualu_gpio_keys);

	ath79_register_usb();

	ath79_init_mac(ath79_eth0_data.mac_addr, mac, 0);

	ath79_register_mdio(0, 0x0);
	ath79_register_eth(0);

	ath79_register_wmac(ee, mac);
}

MIPS_MACHINE(ATH79_Hualu_Wifi_Dock, "Hualu", "Hualu Wifi Dock",
	     hualu_setup);