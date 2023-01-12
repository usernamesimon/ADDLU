create_clock -name "clk_virt" -period 16.667ns
create_clock -name "clk_dst" -period 16.667ns [get_ports {clk_dst}]
create_clock -name "clk_src" -period 16.667ns [get_ports {clk_src}]

derive_pll_clocks -create_base_clocks

derive_clock_uncertainty

set_clock_uncertainty -from "clk_dst" -to "clk_src" 27.32ns

set_input_delay -clock { clk_virt } 1 [get_ports {clk_dst clk_src reset_n}]

set_output_delay -clock { clk_virt } 1 [get_ports {clk_dst_out[0] clk_dst_out[1] clk_src_out[0] clk_src_out[1] data_dst[0] data_dst[1] data_dst[2] data_dst[3] data_dst[4] data_dst[5] data_dst[6] data_dst[7] data_dst[8] data_dst[9] data_dst[10] data_dst[11] data_src[0] data_src[1] data_src[2] data_src[3] data_src[4] data_src[5] data_src[6] data_src[7] data_src[8] data_src[9] data_src[10] data_src[11] req ack}]