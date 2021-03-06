/* SPDX-License-Identifier: GPL-2.0-only */

#ifndef _SOC_QUALCOMM_SC7280_ADDRESS_MAP_H_
#define _SOC_QUALCOMM_SC7280_ADDRESS_MAP_H_

#include <stdint.h>

#define AOSS_CC_BASE			0x0C2A0000
#define DISP_CC_BASE			0x0AF00000
#define GCC_BASE			0x00100000
#define L3_PLL_BASE			0x18284000
#define QSPI_BASE			0x088DC000
#define SHRM_SPROC_BASE			0x09051000
#define SILVER_PLL_BASE			0x18280000
#define TLMM_TILE_BASE			0x0F100000

/* SC7280 QSPI GPIO PINS */
#define QSPI_CS				GPIO(15)
#define QSPI_DATA_0			GPIO(12)
#define QSPI_DATA_1			GPIO(13)
#define QSPI_CLK			GPIO(14)

#define GPIO_FUNC_QSPI_DATA_0		GPIO12_FUNC_QSPI_DATA_0
#define GPIO_FUNC_QSPI_DATA_1		GPIO13_FUNC_QSPI_DATA_1
#define GPIO_FUNC_QSPI_CLK		GPIO14_FUNC_QSPI_CLK

/* SDHC TLMM Registers */
#define SDC1_TLMM_CFG_ADDR		0x0F1B3000
#define SDC2_TLMM_CFG_ADDR		0x0F1B4000

/*
 * QUP SERIAL ENGINE BASE ADDRESSES
 */
/* QUPV3_0 */
#define QUP_SERIAL0_BASE		0x00980000
#define QUP_SERIAL1_BASE		0x00984000
#define QUP_SERIAL2_BASE		0x00988000
#define QUP_SERIAL3_BASE		0x0098C000
#define QUP_SERIAL4_BASE		0x00990000
#define QUP_SERIAL5_BASE		0x00994000
#define QUP_SERIAL6_BASE		0x00998000
#define QUP_SERIAL7_BASE		0x0099C000
#define QUP_WRAP0_BASE			0x009C0000
#define QUP_0_GSI_BASE			0x00904000

/* QUPV3_1 */
#define QUP_SERIAL8_BASE		0x00A80000
#define QUP_SERIAL9_BASE		0x00A84000
#define QUP_SERIAL10_BASE		0x00A88000
#define QUP_SERIAL11_BASE		0x00A8C000
#define QUP_SERIAL12_BASE		0x00A90000
#define QUP_SERIAL13_BASE		0x00A94000
#define QUP_SERIAL14_BASE		0x00A98000
#define QUP_SERIAL15_BASE		0x00A9C000
#define QUP_WRAP1_BASE			0x00AC0000
#define QUP_1_GSI_BASE			0x00A04000

#endif /*  __SOC_QUALCOMM_SC7280_ADDRESS_MAP_H__ */
