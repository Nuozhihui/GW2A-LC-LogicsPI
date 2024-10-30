module gw_gao(
    init_calib_complete,
    \u_rd/error_int1[0] ,
    \u_rd/error_int1[1] ,
    \u_rd/error_int1[2] ,
    \u_rd/error_int1[3] ,
    \u_rd/error_int1[4] ,
    \u_rd/error_int1[5] ,
    \u_rd/error_int1[6] ,
    \u_rd/error_int1[7] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/read_rclksel_conf[1] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/read_rclksel_conf[0] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/data_calib_done[1] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/data_calib_done[0] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[127] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[126] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[125] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[124] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[123] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[122] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[121] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[120] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[119] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[118] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[117] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[116] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[115] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[114] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[113] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[112] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[111] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[110] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[109] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[108] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[107] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[106] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[105] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[104] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[103] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[102] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[101] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[100] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[99] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[98] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[97] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[96] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[95] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[94] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[93] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[92] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[91] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[90] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[89] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[88] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[87] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[86] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[85] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[84] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[83] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[82] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[81] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[80] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[79] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[78] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[77] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[76] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[75] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[74] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[73] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[72] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[71] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[70] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[69] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[68] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[67] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[66] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[65] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[64] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[63] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[62] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[61] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[60] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[59] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[58] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[57] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[56] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[55] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[54] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[53] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[52] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[51] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[50] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[49] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[48] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[47] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[46] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[45] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[44] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[43] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[42] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[41] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[40] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[39] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[38] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[37] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[36] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[35] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[34] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[33] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[32] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[31] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[30] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[29] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[28] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[27] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[26] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[25] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[24] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[23] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[22] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[21] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[20] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[19] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[18] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[17] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[16] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[15] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[14] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[13] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[12] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[11] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[10] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[9] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[8] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[7] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[6] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[5] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[4] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[3] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[2] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[1] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[0] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_valid_r[1] ,
    \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_valid_r[0] ,
    clk_x1,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input init_calib_complete;
input \u_rd/error_int1[0] ;
input \u_rd/error_int1[1] ;
input \u_rd/error_int1[2] ;
input \u_rd/error_int1[3] ;
input \u_rd/error_int1[4] ;
input \u_rd/error_int1[5] ;
input \u_rd/error_int1[6] ;
input \u_rd/error_int1[7] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/read_rclksel_conf[1] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/read_rclksel_conf[0] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/data_calib_done[1] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/data_calib_done[0] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[127] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[126] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[125] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[124] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[123] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[122] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[121] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[120] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[119] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[118] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[117] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[116] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[115] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[114] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[113] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[112] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[111] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[110] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[109] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[108] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[107] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[106] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[105] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[104] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[103] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[102] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[101] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[100] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[99] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[98] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[97] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[96] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[95] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[94] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[93] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[92] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[91] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[90] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[89] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[88] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[87] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[86] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[85] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[84] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[83] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[82] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[81] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[80] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[79] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[78] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[77] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[76] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[75] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[74] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[73] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[72] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[71] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[70] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[69] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[68] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[67] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[66] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[65] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[64] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[63] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[62] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[61] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[60] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[59] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[58] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[57] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[56] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[55] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[54] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[53] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[52] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[51] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[50] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[49] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[48] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[47] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[46] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[45] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[44] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[43] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[42] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[41] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[40] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[39] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[38] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[37] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[36] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[35] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[34] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[33] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[32] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[31] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[30] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[29] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[28] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[27] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[26] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[25] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[24] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[23] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[22] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[21] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[20] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[19] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[18] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[17] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[16] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[15] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[14] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[13] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[12] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[11] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[10] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[9] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[8] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[7] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[6] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[5] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[4] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[3] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[2] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[1] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[0] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_valid_r[1] ;
input \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_valid_r[0] ;
input clk_x1;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire init_calib_complete;
wire \u_rd/error_int1[0] ;
wire \u_rd/error_int1[1] ;
wire \u_rd/error_int1[2] ;
wire \u_rd/error_int1[3] ;
wire \u_rd/error_int1[4] ;
wire \u_rd/error_int1[5] ;
wire \u_rd/error_int1[6] ;
wire \u_rd/error_int1[7] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/read_rclksel_conf[1] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/read_rclksel_conf[0] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/data_calib_done[1] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/data_calib_done[0] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[127] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[126] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[125] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[124] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[123] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[122] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[121] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[120] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[119] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[118] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[117] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[116] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[115] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[114] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[113] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[112] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[111] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[110] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[109] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[108] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[107] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[106] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[105] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[104] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[103] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[102] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[101] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[100] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[99] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[98] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[97] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[96] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[95] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[94] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[93] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[92] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[91] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[90] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[89] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[88] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[87] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[86] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[85] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[84] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[83] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[82] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[81] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[80] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[79] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[78] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[77] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[76] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[75] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[74] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[73] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[72] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[71] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[70] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[69] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[68] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[67] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[66] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[65] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[64] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[63] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[62] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[61] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[60] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[59] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[58] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[57] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[56] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[55] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[54] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[53] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[52] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[51] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[50] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[49] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[48] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[47] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[46] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[45] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[44] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[43] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[42] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[41] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[40] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[39] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[38] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[37] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[36] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[35] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[34] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[33] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[32] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[31] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[30] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[29] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[28] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[27] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[26] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[25] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[24] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[23] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[22] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[21] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[20] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[19] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[18] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[17] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[16] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[15] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[14] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[13] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[12] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[11] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[10] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[9] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[8] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[7] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[6] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[5] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[4] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[3] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[2] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[1] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[0] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_valid_r[1] ;
wire \u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_valid_r[0] ;
wire clk_x1;
wire tms_pad_i;
wire tck_pad_i;
wire tdi_pad_i;
wire tdo_pad_o;
wire tms_i_c;
wire tck_i_c;
wire tdi_i_c;
wire tdo_o_c;
wire [9:0] control0;
wire gao_jtag_tck;
wire gao_jtag_reset;
wire run_test_idle_er1;
wire run_test_idle_er2;
wire shift_dr_capture_dr;
wire update_dr;
wire pause_dr;
wire enable_er1;
wire enable_er2;
wire gao_jtag_tdi;
wire tdo_er1;

IBUF tms_ibuf (
    .I(tms_pad_i),
    .O(tms_i_c)
);

IBUF tck_ibuf (
    .I(tck_pad_i),
    .O(tck_i_c)
);

IBUF tdi_ibuf (
    .I(tdi_pad_i),
    .O(tdi_i_c)
);

OBUF tdo_obuf (
    .I(tdo_o_c),
    .O(tdo_pad_o)
);

GW_JTAG  u_gw_jtag(
    .tms_pad_i(tms_i_c),
    .tck_pad_i(tck_i_c),
    .tdi_pad_i(tdi_i_c),
    .tdo_pad_o(tdo_o_c),
    .tck_o(gao_jtag_tck),
    .test_logic_reset_o(gao_jtag_reset),
    .run_test_idle_er1_o(run_test_idle_er1),
    .run_test_idle_er2_o(run_test_idle_er2),
    .shift_dr_capture_dr_o(shift_dr_capture_dr),
    .update_dr_o(update_dr),
    .pause_dr_o(pause_dr),
    .enable_er1_o(enable_er1),
    .enable_er2_o(enable_er2),
    .tdi_o(gao_jtag_tdi),
    .tdo_er1_i(tdo_er1),
    .tdo_er2_i(1'b0)
);

gw_con_top  u_icon_top(
    .tck_i(gao_jtag_tck),
    .tdi_i(gao_jtag_tdi),
    .tdo_o(tdo_er1),
    .rst_i(gao_jtag_reset),
    .control0(control0[9:0]),
    .enable_i(enable_er1),
    .shift_dr_capture_dr_i(shift_dr_capture_dr),
    .update_dr_i(update_dr)
);

ao_top_0  u_la0_top(
    .control(control0[9:0]),
    .trig0_i({\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/read_rclksel_conf[1] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/read_rclksel_conf[0] }),
    .data_i({init_calib_complete,\u_rd/error_int1[0] ,\u_rd/error_int1[1] ,\u_rd/error_int1[2] ,\u_rd/error_int1[3] ,\u_rd/error_int1[4] ,\u_rd/error_int1[5] ,\u_rd/error_int1[6] ,\u_rd/error_int1[7] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/read_rclksel_conf[1] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/read_rclksel_conf[0] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/data_calib_done[1] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/data_calib_done[0] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[127] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[126] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[125] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[124] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[123] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[122] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[121] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[120] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[119] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[118] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[117] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[116] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[115] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[114] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[113] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[112] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[111] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[110] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[109] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[108] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[107] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[106] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[105] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[104] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[103] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[102] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[101] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[100] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[99] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[98] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[97] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[96] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[95] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[94] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[93] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[92] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[91] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[90] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[89] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[88] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[87] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[86] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[85] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[84] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[83] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[82] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[81] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[80] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[79] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[78] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[77] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[76] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[75] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[74] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[73] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[72] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[71] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[70] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[69] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[68] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[67] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[66] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[65] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[64] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[63] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[62] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[61] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[60] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[59] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[58] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[57] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[56] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[55] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[54] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[53] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[52] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[51] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[50] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[49] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[48] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[47] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[46] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[45] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[44] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[43] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[42] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[41] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[40] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[39] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[38] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[37] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[36] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[35] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[34] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[33] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[32] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[31] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[30] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[29] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[28] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[27] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[26] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[25] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[24] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[23] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[22] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[21] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[20] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[19] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[18] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[17] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[16] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[15] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[14] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[13] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[12] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[11] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[10] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[9] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[8] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[7] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[6] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[5] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[4] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[3] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[2] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[1] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_r[0] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_valid_r[1] ,\u_ddr3/gw3_top/u_ddr_phy_top/u_ddr_init/phy_rdbk_data_valid_r[0] }),
    .clk_i(clk_x1)
);

endmodule
