/* SPDX-License-Identifier: GPL-2.0-only */

#include <device/device.h>
#include <device/mmio.h>
#include <vendorcode/google/chromeos/chromeos.h>
#include <soc/usb.h>
#include <soc/addressmap.h>

static struct usb_board_data usb1_board_data = {
	.parameter_override_x0 = 0x63,
	.parameter_override_x1 = 0x03,
	.parameter_override_x0 = 0x1d,
	.parameter_override_x1 = 0x03,
};

static void setup_usb(void)
{
	/* Setting Secondary USB controller */
	setup_usb_host(HSUSB_HS_PORT_1, &usb1_board_data);
}

static void configure_sdhci(void)
{
	/* Program eMMC drive strength to 16/10/10 mA */
	write32((void *)SDC1_TLMM_CFG_ADDR, 0x9FE4);
}

static void mainboard_init(struct device *dev)
{
	/* Copy WIFI calibration data into CBMEM. */
	if (CONFIG(CHROMEOS))
		cbmem_add_vpd_calibration_data();

	setup_usb();
	configure_sdhci();
}

static void mainboard_enable(struct device *dev)
{
	dev->ops->init = &mainboard_init;
}

struct chip_operations mainboard_ops = {
	.enable_dev = mainboard_enable,
};
