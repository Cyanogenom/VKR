// ============================================================================
// Copyright (c) 2015 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//  
//  
//                     web: http://www.terasic.com/  
//                     email: support@terasic.com
//
// ============================================================================
//Date:  Tue Mar  3 15:11:40 2015
// ============================================================================

//`define ENABLE_HPS

module DE10_Nano_golden_top(


      ///////// FPGA /////////
      input              FPGA_CLK1_50,
      input              FPGA_CLK2_50,
      input              FPGA_CLK3_50,

      ///////// HDMI /////////
      inout              HDMI_I2C_SCL,
      inout              HDMI_I2C_SDA,
      inout              HDMI_I2S,
      inout              HDMI_LRCLK,
      inout              HDMI_MCLK,
      inout              HDMI_SCLK,
      output             HDMI_TX_CLK,
      output      [23:0] HDMI_TX_D,
      output             HDMI_TX_DE,
      output             HDMI_TX_HS,
      input              HDMI_TX_INT,
      output             HDMI_TX_VS,

      ///////// HPS /////////
      inout              HPS_CONV_USB_N,
      output      [14:0] HPS_DDR3_ADDR,
      output      [2:0]  HPS_DDR3_BA,
      output             HPS_DDR3_CAS_N,
      output             HPS_DDR3_CKE,
      output             HPS_DDR3_CK_N,
      output             HPS_DDR3_CK_P,
      output             HPS_DDR3_CS_N,
      output      [3:0]  HPS_DDR3_DM,
      inout       [31:0] HPS_DDR3_DQ,
      inout       [3:0]  HPS_DDR3_DQS_N,
      inout       [3:0]  HPS_DDR3_DQS_P,
      output             HPS_DDR3_ODT,
      output             HPS_DDR3_RAS_N,
      output             HPS_DDR3_RESET_N,
      input              HPS_DDR3_RZQ,
      output             HPS_DDR3_WE_N,
      output             HPS_ENET_GTX_CLK,
      inout              HPS_ENET_INT_N,
      output             HPS_ENET_MDC,
      inout              HPS_ENET_MDIO,
      input              HPS_ENET_RX_CLK,
      input       [3:0]  HPS_ENET_RX_DATA,
      input              HPS_ENET_RX_DV,
      output      [3:0]  HPS_ENET_TX_DATA,
      output             HPS_ENET_TX_EN,
      inout              HPS_GSENSOR_INT,
      inout              HPS_I2C0_SCLK,
      inout              HPS_I2C0_SDAT,
      inout              HPS_I2C1_SCLK,
      inout              HPS_I2C1_SDAT,
      inout              HPS_KEY,
      inout              HPS_LED,
      inout              HPS_LTC_GPIO,
      output             HPS_SD_CLK,
      inout              HPS_SD_CMD,
      inout       [3:0]  HPS_SD_DATA,
      output             HPS_SPIM_CLK,
      input              HPS_SPIM_MISO,
      output             HPS_SPIM_MOSI,
      inout              HPS_SPIM_SS,
      input              HPS_UART_RX,
      output             HPS_UART_TX,
      input              HPS_USB_CLKOUT,
      inout       [7:0]  HPS_USB_DATA,
      input              HPS_USB_DIR,
      input              HPS_USB_NXT,
      output             HPS_USB_STP,

      ///////// KEY /////////
      input       [1:0]  KEY,

      ///////// LED /////////
      output      [7:0]  LED,

      ///////// SW /////////
      input       [3:0]  SW
);


//=======================================================
//  REG/WIRE declarations
//=======================================================

wire HPS_H2F_RST;




//=======================================================
//  Structural coding
//=======================================================



test_led proverka (
		.clk_clk (FPGA_CLK1_50),                         //             clk.clk
		.hps_0_h2f_reset_reset_n (HPS_H2F_RST),         // hps_0_h2f_reset.reset_n
		.hps_io_hps_io_emac1_inst_TX_CLK (HPS_ENET_GTX_CLK), //          hps_io.hps_io_emac1_inst_TX_CLK
		.hps_io_hps_io_emac1_inst_TXD0 (HPS_ENET_TX_DATA[0]),   //                .hps_io_emac1_inst_TXD0
		.hps_io_hps_io_emac1_inst_TXD1 (HPS_ENET_TX_DATA[1]),   //                .hps_io_emac1_inst_TXD1
		.hps_io_hps_io_emac1_inst_TXD2 (HPS_ENET_TX_DATA[2]),   //                .hps_io_emac1_inst_TXD2
		.hps_io_hps_io_emac1_inst_TXD3 (HPS_ENET_TX_DATA[3]),   //                .hps_io_emac1_inst_TXD3
		.hps_io_hps_io_emac1_inst_RXD0 (HPS_ENET_RX_DATA[0]),   //                .hps_io_emac1_inst_RXD0
		.hps_io_hps_io_emac1_inst_MDIO (HPS_ENET_MDIO),   //                .hps_io_emac1_inst_MDIO
		.hps_io_hps_io_emac1_inst_MDC (HPS_ENET_MDC),    //                .hps_io_emac1_inst_MDC
		.hps_io_hps_io_emac1_inst_RX_CTL (HPS_ENET_RX_DV), //                .hps_io_emac1_inst_RX_CTL
		.hps_io_hps_io_emac1_inst_TX_CTL (HPS_ENET_TX_EN), //                .hps_io_emac1_inst_TX_CTL
		.hps_io_hps_io_emac1_inst_RX_CLK (HPS_ENET_RX_CLK), //                .hps_io_emac1_inst_RX_CLK
		.hps_io_hps_io_emac1_inst_RXD1 (HPS_ENET_RX_DATA[1]),   //                .hps_io_emac1_inst_RXD1
		.hps_io_hps_io_emac1_inst_RXD2 (HPS_ENET_RX_DATA[2]),   //                .hps_io_emac1_inst_RXD2
		.hps_io_hps_io_emac1_inst_RXD3 (HPS_ENET_RX_DATA[3]),   //                .hps_io_emac1_inst_RXD3
		.hps_io_hps_io_sdio_inst_CMD (HPS_SD_CMD),     //                .hps_io_sdio_inst_CMD
		.hps_io_hps_io_sdio_inst_D0 (HPS_SD_DATA[0]),      //                .hps_io_sdio_inst_D0
		.hps_io_hps_io_sdio_inst_D1 (HPS_SD_DATA[1]),      //                .hps_io_sdio_inst_D1
		.hps_io_hps_io_sdio_inst_CLK (HPS_SD_CLK),     //                .hps_io_sdio_inst_CLK
		.hps_io_hps_io_sdio_inst_D2 (HPS_SD_DATA[2]),      //                .hps_io_sdio_inst_D2
		.hps_io_hps_io_sdio_inst_D3 (HPS_SD_DATA[3]),      //                .hps_io_sdio_inst_D3
		.hps_io_hps_io_usb1_inst_D0 (HPS_USB_DATA[0]),      //                .hps_io_usb1_inst_D0
		.hps_io_hps_io_usb1_inst_D1 (HPS_USB_DATA[1]),      //                .hps_io_usb1_inst_D1
		.hps_io_hps_io_usb1_inst_D2 (HPS_USB_DATA[2]),      //                .hps_io_usb1_inst_D2
		.hps_io_hps_io_usb1_inst_D3 (HPS_USB_DATA[3]),      //                .hps_io_usb1_inst_D3
		.hps_io_hps_io_usb1_inst_D4 (HPS_USB_DATA[4]),      //                .hps_io_usb1_inst_D4
		.hps_io_hps_io_usb1_inst_D5 (HPS_USB_DATA[5]),      //                .hps_io_usb1_inst_D5
		.hps_io_hps_io_usb1_inst_D6 (HPS_USB_DATA[6]),      //                .hps_io_usb1_inst_D6
		.hps_io_hps_io_usb1_inst_D7 (HPS_USB_DATA[7]),      //                .hps_io_usb1_inst_D7
		.hps_io_hps_io_usb1_inst_CLK (HPS_USB_CLKOUT),     //                .hps_io_usb1_inst_CLK
		.hps_io_hps_io_usb1_inst_STP (HPS_USB_STP),     //                .hps_io_usb1_inst_STP
		.hps_io_hps_io_usb1_inst_DIR (HPS_USB_DIR),     //                .hps_io_usb1_inst_DIR
		.hps_io_hps_io_usb1_inst_NXT (HPS_USB_NXT),     //                .hps_io_usb1_inst_NXT
		.hps_io_hps_io_uart0_inst_RX (HPS_UART_RX),     //                .hps_io_uart0_inst_RX
		.hps_io_hps_io_uart0_inst_TX (HPS_UART_TX),     //                .hps_io_uart0_inst_TX
		.ledr_export (LED[3:0]),                     //            ledr.export
		.memory_mem_a (HPS_DDR3_ADDR),                    //          memory.mem_a
		.memory_mem_ba (HPS_DDR3_BA),                   //                .mem_ba
		.memory_mem_ck (HPS_DDR3_CK_P),                   //                .mem_ck
		.memory_mem_ck_n (HPS_DDR3_CK_N),                 //                .mem_ck_n
		.memory_mem_cke (HPS_DDR3_CKE),                  //                .mem_cke
		.memory_mem_cs_n (HPS_DDR3_CS_N),                 //                .mem_cs_n
		.memory_mem_ras_n (HPS_DDR3_RAS_N),                //                .mem_ras_n
		.memory_mem_cas_n (HPS_DDR3_CAS_N),                //                .mem_cas_n
		.memory_mem_we_n (HPS_DDR3_WE_N),                 //                .mem_we_n
		.memory_mem_reset_n (HPS_DDR3_RESET_N),              //                .mem_reset_n
		.memory_mem_dq (HPS_DDR3_DQ),                   //                .mem_dq
		.memory_mem_dqs (HPS_DDR3_DQS_P),                  //                .mem_dqs
		.memory_mem_dqs_n (HPS_DDR3_DQS_N),                //                .mem_dqs_n
		.memory_mem_odt (HPS_DDR3_ODT),                  //                .mem_odt
		.memory_mem_dm (HPS_DDR3_DM),                   //                .mem_dm
		.memory_oct_rzqin (HPS_DDR3_RZQ),                //                .oct_rzqin
		.reset_reset_n (1'b1),                   //           reset.reset_n
		.sw_export (SW)                       //              sw.export
	);


endmodule
