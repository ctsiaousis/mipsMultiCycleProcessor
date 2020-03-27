/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_3564397177;
char *IEEE_P_0774719531;
char *IEEE_P_2592010699;
char *IEEE_P_3499444699;
char *IEEE_P_1242562249;
char *STD_STANDARD;
char *IEEE_P_3620187407;
char *STD_TEXTIO;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    work_a_0081678826_1211705562_init();
    work_a_0514476422_3212880686_init();
    work_a_4057698360_3212880686_init();
    work_a_3779452905_3212880686_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    ieee_p_0774719531_init();
    work_a_1540508602_3212880686_init();
    work_a_3230033019_3212880686_init();
    work_a_0067326162_3212880686_init();
    work_a_3226698250_3212880686_init();
    work_a_0945232442_3212880686_init();
    work_a_0832606739_3212880686_init();
    work_a_1676837276_3212880686_init();
    work_a_0589293356_3212880686_init();
    work_a_0811716043_3212880686_init();
    work_a_1307603632_3212880686_init();
    work_a_0975640890_3212880686_init();
    work_a_1315662971_3212880686_init();
    work_a_3337825057_3212880686_init();
    work_a_2278322344_3212880686_init();
    work_a_0953353097_3212880686_init();
    work_a_1595588133_3212880686_init();
    work_a_3056889143_3212880686_init();
    work_a_3047744249_3212880686_init();
    std_textio_init();
    ieee_p_3564397177_init();
    work_a_3392787015_0000452272_init();
    work_a_0625433760_3212880686_init();
    work_a_0614311723_3212880686_init();
    work_a_1991350011_3212880686_init();
    work_a_2459709299_3212880686_init();
    work_a_2554222114_3212880686_init();
    work_a_2399776393_3212880686_init();
    work_a_1640669797_3212880686_init();
    work_a_3662240293_2372691052_init();


    xsi_register_tops("work_a_3662240293_2372691052");

    IEEE_P_3564397177 = xsi_get_engine_memory("ieee_p_3564397177");
    IEEE_P_0774719531 = xsi_get_engine_memory("ieee_p_0774719531");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");

    return xsi_run_simulation(argc, argv);

}
