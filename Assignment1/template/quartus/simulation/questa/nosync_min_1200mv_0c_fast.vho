-- Copyright (C) 2022  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 22.1std.0 Build 915 10/25/2022 SC Lite Edition"

-- DATE "01/12/2023 22:36:41"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	top IS
    PORT (
	clk_src : IN std_logic;
	clk_dst : IN std_logic;
	reset_n : IN std_logic;
	data_src : BUFFER std_logic_vector(11 DOWNTO 0);
	req : BUFFER std_logic;
	data_dst : BUFFER std_logic_vector(11 DOWNTO 0);
	ack : BUFFER std_logic;
	clk_src_out : BUFFER std_logic_vector(1 DOWNTO 0);
	clk_dst_out : BUFFER std_logic_vector(1 DOWNTO 0)
	);
END top;

-- Design Ports Information
-- data_src[0]	=>  Location: PIN_AC19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_src[1]	=>  Location: PIN_AD19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_src[2]	=>  Location: PIN_AF24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_src[3]	=>  Location: PIN_AF25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_src[4]	=>  Location: PIN_AE22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_src[5]	=>  Location: PIN_AF22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_src[6]	=>  Location: PIN_AG25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_src[7]	=>  Location: PIN_AH25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_src[8]	=>  Location: PIN_AG22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_src[9]	=>  Location: PIN_AH22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_src[10]	=>  Location: PIN_AE20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_src[11]	=>  Location: PIN_AF20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- req	=>  Location: PIN_AB21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_dst[0]	=>  Location: PIN_AF16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_dst[1]	=>  Location: PIN_AF15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_dst[2]	=>  Location: PIN_AE21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_dst[3]	=>  Location: PIN_AC22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_dst[4]	=>  Location: PIN_AF21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_dst[5]	=>  Location: PIN_AD22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_dst[6]	=>  Location: PIN_AD25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_dst[7]	=>  Location: PIN_AE25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_dst[8]	=>  Location: PIN_AE24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_dst[9]	=>  Location: PIN_AF26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_dst[10]	=>  Location: PIN_AG23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_dst[11]	=>  Location: PIN_AH26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- ack	=>  Location: PIN_Y17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- clk_src_out[0]	=>  Location: PIN_V23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- clk_src_out[1]	=>  Location: PIN_AB22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- clk_dst_out[0]	=>  Location: PIN_V24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- clk_dst_out[1]	=>  Location: PIN_AC15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- clk_src	=>  Location: PIN_Y27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- clk_dst	=>  Location: PIN_Y28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- reset_n	=>  Location: PIN_M23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF top IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk_src : std_logic;
SIGNAL ww_clk_dst : std_logic;
SIGNAL ww_reset_n : std_logic;
SIGNAL ww_data_src : std_logic_vector(11 DOWNTO 0);
SIGNAL ww_req : std_logic;
SIGNAL ww_data_dst : std_logic_vector(11 DOWNTO 0);
SIGNAL ww_ack : std_logic;
SIGNAL ww_clk_src_out : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_clk_dst_out : std_logic_vector(1 DOWNTO 0);
SIGNAL \clk_dst~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk_src~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \data_src[0]~output_o\ : std_logic;
SIGNAL \data_src[1]~output_o\ : std_logic;
SIGNAL \data_src[2]~output_o\ : std_logic;
SIGNAL \data_src[3]~output_o\ : std_logic;
SIGNAL \data_src[4]~output_o\ : std_logic;
SIGNAL \data_src[5]~output_o\ : std_logic;
SIGNAL \data_src[6]~output_o\ : std_logic;
SIGNAL \data_src[7]~output_o\ : std_logic;
SIGNAL \data_src[8]~output_o\ : std_logic;
SIGNAL \data_src[9]~output_o\ : std_logic;
SIGNAL \data_src[10]~output_o\ : std_logic;
SIGNAL \data_src[11]~output_o\ : std_logic;
SIGNAL \req~output_o\ : std_logic;
SIGNAL \data_dst[0]~output_o\ : std_logic;
SIGNAL \data_dst[1]~output_o\ : std_logic;
SIGNAL \data_dst[2]~output_o\ : std_logic;
SIGNAL \data_dst[3]~output_o\ : std_logic;
SIGNAL \data_dst[4]~output_o\ : std_logic;
SIGNAL \data_dst[5]~output_o\ : std_logic;
SIGNAL \data_dst[6]~output_o\ : std_logic;
SIGNAL \data_dst[7]~output_o\ : std_logic;
SIGNAL \data_dst[8]~output_o\ : std_logic;
SIGNAL \data_dst[9]~output_o\ : std_logic;
SIGNAL \data_dst[10]~output_o\ : std_logic;
SIGNAL \data_dst[11]~output_o\ : std_logic;
SIGNAL \ack~output_o\ : std_logic;
SIGNAL \clk_src_out[0]~output_o\ : std_logic;
SIGNAL \clk_src_out[1]~output_o\ : std_logic;
SIGNAL \clk_dst_out[0]~output_o\ : std_logic;
SIGNAL \clk_dst_out[1]~output_o\ : std_logic;
SIGNAL \clk_src~input_o\ : std_logic;
SIGNAL \clk_src~inputclkctrl_outclk\ : std_logic;
SIGNAL \src_inst|data_cnt[0]~4_combout\ : std_logic;
SIGNAL \src_inst|reset_sync[1]~feeder_combout\ : std_logic;
SIGNAL \reset_n~input_o\ : std_logic;
SIGNAL \src_inst|reset_sync[0]~feeder_combout\ : std_logic;
SIGNAL \clk_dst~input_o\ : std_logic;
SIGNAL \clk_dst~inputclkctrl_outclk\ : std_logic;
SIGNAL \dst_inst|ackreg~0_combout\ : std_logic;
SIGNAL \dst_inst|reset_sync[1]~feeder_combout\ : std_logic;
SIGNAL \dst_inst|reset_sync[0]~feeder_combout\ : std_logic;
SIGNAL \dst_inst|oldreq~q\ : std_logic;
SIGNAL \dst_inst|reg~0_combout\ : std_logic;
SIGNAL \dst_inst|ackreg~q\ : std_logic;
SIGNAL \src_inst|oldack~q\ : std_logic;
SIGNAL \src_inst|sync~0_combout\ : std_logic;
SIGNAL \src_inst|data_cnt[1]~0_combout\ : std_logic;
SIGNAL \src_inst|data_cnt[1]~feeder_combout\ : std_logic;
SIGNAL \src_inst|data_cnt[1]~1_combout\ : std_logic;
SIGNAL \src_inst|data_cnt[2]~2_combout\ : std_logic;
SIGNAL \src_inst|data_cnt[2]~feeder_combout\ : std_logic;
SIGNAL \src_inst|data_cnt[3]~3_combout\ : std_logic;
SIGNAL \src_inst|data_cnt[3]~feeder_combout\ : std_logic;
SIGNAL \src_inst|data_tgl[0]~0_combout\ : std_logic;
SIGNAL \src_inst|data_tgl[1]~1_combout\ : std_logic;
SIGNAL \src_inst|data_tgl[2]~2_combout\ : std_logic;
SIGNAL \src_inst|data_tgl[3]~3_combout\ : std_logic;
SIGNAL \src_inst|data_tgl[4]~4_combout\ : std_logic;
SIGNAL \src_inst|data_tgl[5]~5_combout\ : std_logic;
SIGNAL \src_inst|data_tgl[6]~6_combout\ : std_logic;
SIGNAL \src_inst|data_tgl[7]~7_combout\ : std_logic;
SIGNAL \dst_inst|datareg[0]~feeder_combout\ : std_logic;
SIGNAL \dst_inst|datareg[1]~feeder_combout\ : std_logic;
SIGNAL \dst_inst|datareg[2]~feeder_combout\ : std_logic;
SIGNAL \dst_inst|datareg[3]~feeder_combout\ : std_logic;
SIGNAL \dst_inst|datareg[5]~0_combout\ : std_logic;
SIGNAL \dst_inst|datareg[7]~1_combout\ : std_logic;
SIGNAL \dst_inst|datareg[7]~feeder_combout\ : std_logic;
SIGNAL \dst_inst|datareg[9]~2_combout\ : std_logic;
SIGNAL \dst_inst|datareg[10]~feeder_combout\ : std_logic;
SIGNAL \dst_inst|datareg[11]~3_combout\ : std_logic;
SIGNAL \src_inst|data_cnt\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \src_inst|data_tgl\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \dst_inst|datareg\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \src_inst|reset_sync\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \dst_inst|reset_sync\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \src_inst|ALT_INV_data_tgl\ : std_logic_vector(7 DOWNTO 1);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk_src <= clk_src;
ww_clk_dst <= clk_dst;
ww_reset_n <= reset_n;
data_src <= ww_data_src;
req <= ww_req;
data_dst <= ww_data_dst;
ack <= ww_ack;
clk_src_out <= ww_clk_src_out;
clk_dst_out <= ww_clk_dst_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk_dst~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk_dst~input_o\);

\clk_src~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk_src~input_o\);
\src_inst|ALT_INV_data_tgl\(7) <= NOT \src_inst|data_tgl\(7);
\src_inst|ALT_INV_data_tgl\(5) <= NOT \src_inst|data_tgl\(5);
\src_inst|ALT_INV_data_tgl\(3) <= NOT \src_inst|data_tgl\(3);
\src_inst|ALT_INV_data_tgl\(1) <= NOT \src_inst|data_tgl\(1);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X94_Y0_N9
\data_src[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \src_inst|data_cnt\(0),
	devoe => ww_devoe,
	o => \data_src[0]~output_o\);

-- Location: IOOBUF_X94_Y0_N2
\data_src[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \src_inst|data_cnt\(1),
	devoe => ww_devoe,
	o => \data_src[1]~output_o\);

-- Location: IOOBUF_X83_Y0_N9
\data_src[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \src_inst|data_cnt\(2),
	devoe => ww_devoe,
	o => \data_src[2]~output_o\);

-- Location: IOOBUF_X83_Y0_N2
\data_src[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \src_inst|data_cnt\(3),
	devoe => ww_devoe,
	o => \data_src[3]~output_o\);

-- Location: IOOBUF_X96_Y0_N9
\data_src[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \src_inst|data_tgl\(0),
	devoe => ww_devoe,
	o => \data_src[4]~output_o\);

-- Location: IOOBUF_X96_Y0_N2
\data_src[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \src_inst|ALT_INV_data_tgl\(1),
	devoe => ww_devoe,
	o => \data_src[5]~output_o\);

-- Location: IOOBUF_X91_Y0_N23
\data_src[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \src_inst|data_tgl\(2),
	devoe => ww_devoe,
	o => \data_src[6]~output_o\);

-- Location: IOOBUF_X91_Y0_N16
\data_src[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \src_inst|ALT_INV_data_tgl\(3),
	devoe => ww_devoe,
	o => \data_src[7]~output_o\);

-- Location: IOOBUF_X79_Y0_N9
\data_src[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \src_inst|data_tgl\(4),
	devoe => ww_devoe,
	o => \data_src[8]~output_o\);

-- Location: IOOBUF_X79_Y0_N2
\data_src[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \src_inst|ALT_INV_data_tgl\(5),
	devoe => ww_devoe,
	o => \data_src[9]~output_o\);

-- Location: IOOBUF_X85_Y0_N23
\data_src[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \src_inst|data_tgl\(6),
	devoe => ww_devoe,
	o => \data_src[10]~output_o\);

-- Location: IOOBUF_X85_Y0_N16
\data_src[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \src_inst|ALT_INV_data_tgl\(7),
	devoe => ww_devoe,
	o => \data_src[11]~output_o\);

-- Location: IOOBUF_X109_Y0_N9
\req~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \src_inst|data_cnt\(0),
	devoe => ww_devoe,
	o => \req~output_o\);

-- Location: IOOBUF_X65_Y0_N16
\data_dst[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dst_inst|datareg\(0),
	devoe => ww_devoe,
	o => \data_dst[0]~output_o\);

-- Location: IOOBUF_X60_Y0_N2
\data_dst[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dst_inst|datareg\(1),
	devoe => ww_devoe,
	o => \data_dst[1]~output_o\);

-- Location: IOOBUF_X85_Y0_N2
\data_dst[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dst_inst|datareg\(2),
	devoe => ww_devoe,
	o => \data_dst[2]~output_o\);

-- Location: IOOBUF_X109_Y0_N2
\data_dst[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dst_inst|datareg\(3),
	devoe => ww_devoe,
	o => \data_dst[3]~output_o\);

-- Location: IOOBUF_X87_Y0_N23
\data_dst[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dst_inst|datareg\(4),
	devoe => ww_devoe,
	o => \data_dst[4]~output_o\);

-- Location: IOOBUF_X111_Y0_N9
\data_dst[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dst_inst|datareg\(5),
	devoe => ww_devoe,
	o => \data_dst[5]~output_o\);

-- Location: IOOBUF_X100_Y0_N23
\data_dst[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dst_inst|datareg\(6),
	devoe => ww_devoe,
	o => \data_dst[6]~output_o\);

-- Location: IOOBUF_X89_Y0_N9
\data_dst[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dst_inst|datareg\(7),
	devoe => ww_devoe,
	o => \data_dst[7]~output_o\);

-- Location: IOOBUF_X100_Y0_N16
\data_dst[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dst_inst|datareg\(8),
	devoe => ww_devoe,
	o => \data_dst[8]~output_o\);

-- Location: IOOBUF_X89_Y0_N2
\data_dst[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dst_inst|datareg\(9),
	devoe => ww_devoe,
	o => \data_dst[9]~output_o\);

-- Location: IOOBUF_X81_Y0_N23
\data_dst[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dst_inst|datareg\(10),
	devoe => ww_devoe,
	o => \data_dst[10]~output_o\);

-- Location: IOOBUF_X113_Y0_N2
\data_dst[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dst_inst|datareg\(11),
	devoe => ww_devoe,
	o => \data_dst[11]~output_o\);

-- Location: IOOBUF_X96_Y0_N23
\ack~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dst_inst|ackreg~q\,
	devoe => ww_devoe,
	o => \ack~output_o\);

-- Location: IOOBUF_X115_Y24_N2
\clk_src_out[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \clk_src~input_o\,
	devoe => ww_devoe,
	o => \clk_src_out[0]~output_o\);

-- Location: IOOBUF_X107_Y0_N2
\clk_src_out[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \clk_src~input_o\,
	devoe => ww_devoe,
	o => \clk_src_out[1]~output_o\);

-- Location: IOOBUF_X115_Y24_N9
\clk_dst_out[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \clk_dst~input_o\,
	devoe => ww_devoe,
	o => \clk_dst_out[0]~output_o\);

-- Location: IOOBUF_X60_Y0_N23
\clk_dst_out[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \clk_dst~input_o\,
	devoe => ww_devoe,
	o => \clk_dst_out[1]~output_o\);

-- Location: IOIBUF_X115_Y37_N15
\clk_src~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk_src,
	o => \clk_src~input_o\);

-- Location: CLKCTRL_G9
\clk_src~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk_src~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk_src~inputclkctrl_outclk\);

-- Location: LCCOMB_X88_Y4_N10
\src_inst|data_cnt[0]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \src_inst|data_cnt[0]~4_combout\ = !\src_inst|data_cnt\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \src_inst|data_cnt\(0),
	combout => \src_inst|data_cnt[0]~4_combout\);

-- Location: LCCOMB_X86_Y4_N18
\src_inst|reset_sync[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \src_inst|reset_sync[1]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \src_inst|reset_sync[1]~feeder_combout\);

-- Location: IOIBUF_X115_Y40_N8
\reset_n~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset_n,
	o => \reset_n~input_o\);

-- Location: FF_X86_Y4_N19
\src_inst|reset_sync[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_src~inputclkctrl_outclk\,
	d => \src_inst|reset_sync[1]~feeder_combout\,
	clrn => \reset_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \src_inst|reset_sync\(1));

-- Location: LCCOMB_X86_Y4_N24
\src_inst|reset_sync[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \src_inst|reset_sync[0]~feeder_combout\ = \src_inst|reset_sync\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \src_inst|reset_sync\(1),
	combout => \src_inst|reset_sync[0]~feeder_combout\);

-- Location: FF_X86_Y4_N25
\src_inst|reset_sync[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_src~inputclkctrl_outclk\,
	d => \src_inst|reset_sync[0]~feeder_combout\,
	clrn => \reset_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \src_inst|reset_sync\(0));

-- Location: IOIBUF_X115_Y37_N22
\clk_dst~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk_dst,
	o => \clk_dst~input_o\);

-- Location: CLKCTRL_G8
\clk_dst~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk_dst~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk_dst~inputclkctrl_outclk\);

-- Location: LCCOMB_X88_Y4_N22
\dst_inst|ackreg~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dst_inst|ackreg~0_combout\ = !\dst_inst|ackreg~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dst_inst|ackreg~q\,
	combout => \dst_inst|ackreg~0_combout\);

-- Location: LCCOMB_X89_Y4_N18
\dst_inst|reset_sync[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dst_inst|reset_sync[1]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \dst_inst|reset_sync[1]~feeder_combout\);

-- Location: FF_X89_Y4_N19
\dst_inst|reset_sync[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dst~inputclkctrl_outclk\,
	d => \dst_inst|reset_sync[1]~feeder_combout\,
	clrn => \reset_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dst_inst|reset_sync\(1));

-- Location: LCCOMB_X89_Y4_N2
\dst_inst|reset_sync[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dst_inst|reset_sync[0]~feeder_combout\ = \dst_inst|reset_sync\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dst_inst|reset_sync\(1),
	combout => \dst_inst|reset_sync[0]~feeder_combout\);

-- Location: FF_X89_Y4_N3
\dst_inst|reset_sync[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dst~inputclkctrl_outclk\,
	d => \dst_inst|reset_sync[0]~feeder_combout\,
	clrn => \reset_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dst_inst|reset_sync\(0));

-- Location: FF_X89_Y4_N1
\dst_inst|oldreq\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dst~inputclkctrl_outclk\,
	asdata => \src_inst|data_cnt\(0),
	clrn => \dst_inst|reset_sync\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dst_inst|oldreq~q\);

-- Location: LCCOMB_X89_Y4_N0
\dst_inst|reg~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dst_inst|reg~0_combout\ = \src_inst|data_cnt\(0) $ (\dst_inst|oldreq~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \src_inst|data_cnt\(0),
	datac => \dst_inst|oldreq~q\,
	combout => \dst_inst|reg~0_combout\);

-- Location: FF_X88_Y4_N15
\dst_inst|ackreg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dst~inputclkctrl_outclk\,
	asdata => \dst_inst|ackreg~0_combout\,
	clrn => \dst_inst|reset_sync\(0),
	sload => VCC,
	ena => \dst_inst|reg~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dst_inst|ackreg~q\);

-- Location: FF_X87_Y4_N7
\src_inst|oldack\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_src~inputclkctrl_outclk\,
	asdata => \dst_inst|ackreg~q\,
	clrn => \src_inst|reset_sync\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \src_inst|oldack~q\);

-- Location: LCCOMB_X88_Y4_N2
\src_inst|sync~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \src_inst|sync~0_combout\ = \src_inst|oldack~q\ $ (\dst_inst|ackreg~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \src_inst|oldack~q\,
	datad => \dst_inst|ackreg~q\,
	combout => \src_inst|sync~0_combout\);

-- Location: FF_X88_Y4_N3
\src_inst|data_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_src~inputclkctrl_outclk\,
	asdata => \src_inst|data_cnt[0]~4_combout\,
	clrn => \src_inst|reset_sync\(0),
	sload => VCC,
	ena => \src_inst|sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \src_inst|data_cnt\(0));

-- Location: LCCOMB_X87_Y4_N8
\src_inst|data_cnt[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \src_inst|data_cnt[1]~0_combout\ = \src_inst|data_cnt\(1) $ (((\src_inst|data_cnt\(0) & (\src_inst|oldack~q\ $ (\dst_inst|ackreg~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \src_inst|oldack~q\,
	datab => \src_inst|data_cnt\(1),
	datac => \dst_inst|ackreg~q\,
	datad => \src_inst|data_cnt\(0),
	combout => \src_inst|data_cnt[1]~0_combout\);

-- Location: LCCOMB_X87_Y4_N16
\src_inst|data_cnt[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \src_inst|data_cnt[1]~feeder_combout\ = \src_inst|data_cnt[1]~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \src_inst|data_cnt[1]~0_combout\,
	combout => \src_inst|data_cnt[1]~feeder_combout\);

-- Location: FF_X87_Y4_N17
\src_inst|data_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_src~inputclkctrl_outclk\,
	d => \src_inst|data_cnt[1]~feeder_combout\,
	clrn => \src_inst|reset_sync\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \src_inst|data_cnt\(1));

-- Location: LCCOMB_X88_Y4_N4
\src_inst|data_cnt[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \src_inst|data_cnt[1]~1_combout\ = (\src_inst|data_cnt\(0) & (\src_inst|oldack~q\ $ (\dst_inst|ackreg~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \src_inst|oldack~q\,
	datab => \src_inst|data_cnt\(0),
	datad => \dst_inst|ackreg~q\,
	combout => \src_inst|data_cnt[1]~1_combout\);

-- Location: LCCOMB_X87_Y4_N30
\src_inst|data_cnt[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \src_inst|data_cnt[2]~2_combout\ = \src_inst|data_cnt\(2) $ (((\src_inst|data_cnt\(1) & \src_inst|data_cnt[1]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \src_inst|data_cnt\(2),
	datab => \src_inst|data_cnt\(1),
	datac => \src_inst|data_cnt[1]~1_combout\,
	combout => \src_inst|data_cnt[2]~2_combout\);

-- Location: LCCOMB_X87_Y4_N26
\src_inst|data_cnt[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \src_inst|data_cnt[2]~feeder_combout\ = \src_inst|data_cnt[2]~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \src_inst|data_cnt[2]~2_combout\,
	combout => \src_inst|data_cnt[2]~feeder_combout\);

-- Location: FF_X87_Y4_N27
\src_inst|data_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_src~inputclkctrl_outclk\,
	d => \src_inst|data_cnt[2]~feeder_combout\,
	clrn => \src_inst|reset_sync\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \src_inst|data_cnt\(2));

-- Location: LCCOMB_X87_Y4_N4
\src_inst|data_cnt[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \src_inst|data_cnt[3]~3_combout\ = \src_inst|data_cnt\(3) $ (((\src_inst|data_cnt\(2) & (\src_inst|data_cnt\(1) & \src_inst|data_cnt[1]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \src_inst|data_cnt\(2),
	datab => \src_inst|data_cnt\(3),
	datac => \src_inst|data_cnt\(1),
	datad => \src_inst|data_cnt[1]~1_combout\,
	combout => \src_inst|data_cnt[3]~3_combout\);

-- Location: LCCOMB_X87_Y4_N20
\src_inst|data_cnt[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \src_inst|data_cnt[3]~feeder_combout\ = \src_inst|data_cnt[3]~3_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \src_inst|data_cnt[3]~3_combout\,
	combout => \src_inst|data_cnt[3]~feeder_combout\);

-- Location: FF_X87_Y4_N21
\src_inst|data_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_src~inputclkctrl_outclk\,
	d => \src_inst|data_cnt[3]~feeder_combout\,
	clrn => \src_inst|reset_sync\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \src_inst|data_cnt\(3));

-- Location: LCCOMB_X88_Y4_N0
\src_inst|data_tgl[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \src_inst|data_tgl[0]~0_combout\ = !\src_inst|data_tgl\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \src_inst|data_tgl\(0),
	combout => \src_inst|data_tgl[0]~0_combout\);

-- Location: FF_X88_Y4_N31
\src_inst|data_tgl[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_src~inputclkctrl_outclk\,
	asdata => \src_inst|data_tgl[0]~0_combout\,
	clrn => \src_inst|reset_sync\(0),
	sload => VCC,
	ena => \src_inst|sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \src_inst|data_tgl\(0));

-- Location: LCCOMB_X88_Y4_N28
\src_inst|data_tgl[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \src_inst|data_tgl[1]~1_combout\ = !\src_inst|data_tgl\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \src_inst|data_tgl\(1),
	combout => \src_inst|data_tgl[1]~1_combout\);

-- Location: FF_X88_Y4_N29
\src_inst|data_tgl[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_src~inputclkctrl_outclk\,
	d => \src_inst|data_tgl[1]~1_combout\,
	clrn => \src_inst|reset_sync\(0),
	ena => \src_inst|sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \src_inst|data_tgl\(1));

-- Location: LCCOMB_X88_Y4_N14
\src_inst|data_tgl[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \src_inst|data_tgl[2]~2_combout\ = !\src_inst|data_tgl\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \src_inst|data_tgl\(2),
	combout => \src_inst|data_tgl[2]~2_combout\);

-- Location: FF_X88_Y4_N23
\src_inst|data_tgl[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_src~inputclkctrl_outclk\,
	asdata => \src_inst|data_tgl[2]~2_combout\,
	clrn => \src_inst|reset_sync\(0),
	sload => VCC,
	ena => \src_inst|sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \src_inst|data_tgl\(2));

-- Location: LCCOMB_X88_Y4_N20
\src_inst|data_tgl[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \src_inst|data_tgl[3]~3_combout\ = !\src_inst|data_tgl\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \src_inst|data_tgl\(3),
	combout => \src_inst|data_tgl[3]~3_combout\);

-- Location: FF_X88_Y4_N21
\src_inst|data_tgl[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_src~inputclkctrl_outclk\,
	d => \src_inst|data_tgl[3]~3_combout\,
	clrn => \src_inst|reset_sync\(0),
	ena => \src_inst|sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \src_inst|data_tgl\(3));

-- Location: LCCOMB_X88_Y4_N8
\src_inst|data_tgl[4]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \src_inst|data_tgl[4]~4_combout\ = !\src_inst|data_tgl\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \src_inst|data_tgl\(4),
	combout => \src_inst|data_tgl[4]~4_combout\);

-- Location: FF_X88_Y4_N5
\src_inst|data_tgl[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_src~inputclkctrl_outclk\,
	asdata => \src_inst|data_tgl[4]~4_combout\,
	clrn => \src_inst|reset_sync\(0),
	sload => VCC,
	ena => \src_inst|sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \src_inst|data_tgl\(4));

-- Location: LCCOMB_X88_Y4_N26
\src_inst|data_tgl[5]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \src_inst|data_tgl[5]~5_combout\ = !\src_inst|data_tgl\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \src_inst|data_tgl\(5),
	combout => \src_inst|data_tgl[5]~5_combout\);

-- Location: FF_X88_Y4_N27
\src_inst|data_tgl[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_src~inputclkctrl_outclk\,
	d => \src_inst|data_tgl[5]~5_combout\,
	clrn => \src_inst|reset_sync\(0),
	ena => \src_inst|sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \src_inst|data_tgl\(5));

-- Location: LCCOMB_X88_Y4_N30
\src_inst|data_tgl[6]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \src_inst|data_tgl[6]~6_combout\ = !\src_inst|data_tgl\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \src_inst|data_tgl\(6),
	combout => \src_inst|data_tgl[6]~6_combout\);

-- Location: FF_X88_Y4_N9
\src_inst|data_tgl[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_src~inputclkctrl_outclk\,
	asdata => \src_inst|data_tgl[6]~6_combout\,
	clrn => \src_inst|reset_sync\(0),
	sload => VCC,
	ena => \src_inst|sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \src_inst|data_tgl\(6));

-- Location: LCCOMB_X88_Y4_N24
\src_inst|data_tgl[7]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \src_inst|data_tgl[7]~7_combout\ = !\src_inst|data_tgl\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \src_inst|data_tgl\(7),
	combout => \src_inst|data_tgl[7]~7_combout\);

-- Location: FF_X88_Y4_N25
\src_inst|data_tgl[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_src~inputclkctrl_outclk\,
	d => \src_inst|data_tgl[7]~7_combout\,
	clrn => \src_inst|reset_sync\(0),
	ena => \src_inst|sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \src_inst|data_tgl\(7));

-- Location: LCCOMB_X87_Y4_N18
\dst_inst|datareg[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dst_inst|datareg[0]~feeder_combout\ = \src_inst|data_cnt\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \src_inst|data_cnt\(0),
	combout => \dst_inst|datareg[0]~feeder_combout\);

-- Location: FF_X87_Y4_N19
\dst_inst|datareg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dst~inputclkctrl_outclk\,
	d => \dst_inst|datareg[0]~feeder_combout\,
	clrn => \dst_inst|reset_sync\(0),
	ena => \dst_inst|reg~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dst_inst|datareg\(0));

-- Location: LCCOMB_X87_Y4_N28
\dst_inst|datareg[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dst_inst|datareg[1]~feeder_combout\ = \src_inst|data_cnt\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \src_inst|data_cnt\(1),
	combout => \dst_inst|datareg[1]~feeder_combout\);

-- Location: FF_X87_Y4_N29
\dst_inst|datareg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dst~inputclkctrl_outclk\,
	d => \dst_inst|datareg[1]~feeder_combout\,
	clrn => \dst_inst|reset_sync\(0),
	ena => \dst_inst|reg~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dst_inst|datareg\(1));

-- Location: LCCOMB_X87_Y4_N22
\dst_inst|datareg[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dst_inst|datareg[2]~feeder_combout\ = \src_inst|data_cnt\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \src_inst|data_cnt\(2),
	combout => \dst_inst|datareg[2]~feeder_combout\);

-- Location: FF_X87_Y4_N23
\dst_inst|datareg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dst~inputclkctrl_outclk\,
	d => \dst_inst|datareg[2]~feeder_combout\,
	clrn => \dst_inst|reset_sync\(0),
	ena => \dst_inst|reg~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dst_inst|datareg\(2));

-- Location: LCCOMB_X87_Y4_N24
\dst_inst|datareg[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dst_inst|datareg[3]~feeder_combout\ = \src_inst|data_cnt\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \src_inst|data_cnt\(3),
	combout => \dst_inst|datareg[3]~feeder_combout\);

-- Location: FF_X87_Y4_N25
\dst_inst|datareg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dst~inputclkctrl_outclk\,
	d => \dst_inst|datareg[3]~feeder_combout\,
	clrn => \dst_inst|reset_sync\(0),
	ena => \dst_inst|reg~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dst_inst|datareg\(3));

-- Location: FF_X88_Y4_N1
\dst_inst|datareg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dst~inputclkctrl_outclk\,
	asdata => \src_inst|data_tgl\(0),
	clrn => \dst_inst|reset_sync\(0),
	sload => VCC,
	ena => \dst_inst|reg~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dst_inst|datareg\(4));

-- Location: LCCOMB_X89_Y4_N20
\dst_inst|datareg[5]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dst_inst|datareg[5]~0_combout\ = !\src_inst|data_tgl\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \src_inst|data_tgl\(1),
	combout => \dst_inst|datareg[5]~0_combout\);

-- Location: FF_X89_Y4_N21
\dst_inst|datareg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dst~inputclkctrl_outclk\,
	d => \dst_inst|datareg[5]~0_combout\,
	clrn => \dst_inst|reset_sync\(0),
	ena => \dst_inst|reg~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dst_inst|datareg\(5));

-- Location: FF_X88_Y4_N13
\dst_inst|datareg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dst~inputclkctrl_outclk\,
	asdata => \src_inst|data_tgl\(2),
	clrn => \dst_inst|reset_sync\(0),
	sload => VCC,
	ena => \dst_inst|reg~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dst_inst|datareg\(6));

-- Location: LCCOMB_X88_Y4_N12
\dst_inst|datareg[7]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \dst_inst|datareg[7]~1_combout\ = !\src_inst|data_tgl\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \src_inst|data_tgl\(3),
	combout => \dst_inst|datareg[7]~1_combout\);

-- Location: LCCOMB_X89_Y4_N26
\dst_inst|datareg[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dst_inst|datareg[7]~feeder_combout\ = \dst_inst|datareg[7]~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dst_inst|datareg[7]~1_combout\,
	combout => \dst_inst|datareg[7]~feeder_combout\);

-- Location: FF_X89_Y4_N27
\dst_inst|datareg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dst~inputclkctrl_outclk\,
	d => \dst_inst|datareg[7]~feeder_combout\,
	clrn => \dst_inst|reset_sync\(0),
	ena => \dst_inst|reg~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dst_inst|datareg\(7));

-- Location: FF_X88_Y4_N11
\dst_inst|datareg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dst~inputclkctrl_outclk\,
	asdata => \src_inst|data_tgl\(4),
	clrn => \dst_inst|reset_sync\(0),
	sload => VCC,
	ena => \dst_inst|reg~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dst_inst|datareg\(8));

-- Location: LCCOMB_X88_Y4_N6
\dst_inst|datareg[9]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dst_inst|datareg[9]~2_combout\ = !\src_inst|data_tgl\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \src_inst|data_tgl\(5),
	combout => \dst_inst|datareg[9]~2_combout\);

-- Location: FF_X89_Y4_N29
\dst_inst|datareg[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dst~inputclkctrl_outclk\,
	asdata => \dst_inst|datareg[9]~2_combout\,
	clrn => \dst_inst|reset_sync\(0),
	sload => VCC,
	ena => \dst_inst|reg~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dst_inst|datareg\(9));

-- Location: LCCOMB_X88_Y4_N18
\dst_inst|datareg[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dst_inst|datareg[10]~feeder_combout\ = \src_inst|data_tgl\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \src_inst|data_tgl\(6),
	combout => \dst_inst|datareg[10]~feeder_combout\);

-- Location: FF_X88_Y4_N19
\dst_inst|datareg[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dst~inputclkctrl_outclk\,
	d => \dst_inst|datareg[10]~feeder_combout\,
	clrn => \dst_inst|reset_sync\(0),
	ena => \dst_inst|reg~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dst_inst|datareg\(10));

-- Location: LCCOMB_X88_Y4_N16
\dst_inst|datareg[11]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \dst_inst|datareg[11]~3_combout\ = !\src_inst|data_tgl\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \src_inst|data_tgl\(7),
	combout => \dst_inst|datareg[11]~3_combout\);

-- Location: FF_X88_Y4_N17
\dst_inst|datareg[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dst~inputclkctrl_outclk\,
	d => \dst_inst|datareg[11]~3_combout\,
	clrn => \dst_inst|reset_sync\(0),
	ena => \dst_inst|reg~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dst_inst|datareg\(11));

ww_data_src(0) <= \data_src[0]~output_o\;

ww_data_src(1) <= \data_src[1]~output_o\;

ww_data_src(2) <= \data_src[2]~output_o\;

ww_data_src(3) <= \data_src[3]~output_o\;

ww_data_src(4) <= \data_src[4]~output_o\;

ww_data_src(5) <= \data_src[5]~output_o\;

ww_data_src(6) <= \data_src[6]~output_o\;

ww_data_src(7) <= \data_src[7]~output_o\;

ww_data_src(8) <= \data_src[8]~output_o\;

ww_data_src(9) <= \data_src[9]~output_o\;

ww_data_src(10) <= \data_src[10]~output_o\;

ww_data_src(11) <= \data_src[11]~output_o\;

ww_req <= \req~output_o\;

ww_data_dst(0) <= \data_dst[0]~output_o\;

ww_data_dst(1) <= \data_dst[1]~output_o\;

ww_data_dst(2) <= \data_dst[2]~output_o\;

ww_data_dst(3) <= \data_dst[3]~output_o\;

ww_data_dst(4) <= \data_dst[4]~output_o\;

ww_data_dst(5) <= \data_dst[5]~output_o\;

ww_data_dst(6) <= \data_dst[6]~output_o\;

ww_data_dst(7) <= \data_dst[7]~output_o\;

ww_data_dst(8) <= \data_dst[8]~output_o\;

ww_data_dst(9) <= \data_dst[9]~output_o\;

ww_data_dst(10) <= \data_dst[10]~output_o\;

ww_data_dst(11) <= \data_dst[11]~output_o\;

ww_ack <= \ack~output_o\;

ww_clk_src_out(0) <= \clk_src_out[0]~output_o\;

ww_clk_src_out(1) <= \clk_src_out[1]~output_o\;

ww_clk_dst_out(0) <= \clk_dst_out[0]~output_o\;

ww_clk_dst_out(1) <= \clk_dst_out[1]~output_o\;
END structure;


