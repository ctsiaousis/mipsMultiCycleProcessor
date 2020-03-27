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

/* This file is designed for use with ISim build 0xc3576ebc */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "U:/6o/ORGANWSH/LAB4/LAB4_impl/mux2to1noCLK.vhd";



static void work_a_1595588133_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    int64 t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(15, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t10 = (5 * 1000LL);
    t11 = (t0 + 1032U);
    t12 = *((char **)t11);
    t11 = (t0 + 3192);
    t13 = (t11 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t12, 5U);
    xsi_driver_first_trans_delta(t11, 0U, 5U, t10);
    t17 = (t0 + 3192);
    xsi_driver_intertial_reject(t17, t10, t10);

LAB2:    t18 = (t0 + 3112);
    *((int *)t18) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 1192U);
    t5 = *((char **)t1);
    t1 = (t0 + 3192);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 5U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB6:    goto LAB2;

}


extern void work_a_1595588133_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1595588133_3212880686_p_0};
	xsi_register_didat("work_a_1595588133_3212880686", "isim/procTEST_isim_beh.exe.sim/work/a_1595588133_3212880686.didat");
	xsi_register_executes(pe);
}
