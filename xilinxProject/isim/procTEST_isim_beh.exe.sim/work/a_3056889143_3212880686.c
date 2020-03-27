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
static const char *ng0 = "U:/6o/ORGANWSH/LAB4/LAB4_impl/convertIMMED.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_2045698577_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_3410769178_1035706684(char *, char *, char *, char *, int );


static void work_a_3056889143_3212880686_p_0(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;

LAB0:    xsi_set_current_line(28, ng0);

LAB3:    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 5728U);
    t4 = ieee_p_1242562249_sub_3410769178_1035706684(IEEE_P_1242562249, t1, t3, t2, 32);
    t5 = (t1 + 12U);
    t6 = *((unsigned int *)t5);
    t6 = (t6 * 1U);
    t7 = (32U != t6);
    if (t7 == 1)
        goto LAB5;

LAB6:    t8 = (t0 + 3760);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t4, 32U);
    xsi_driver_first_trans_fast(t8);

LAB2:    t13 = (t0 + 3648);
    *((int *)t13) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t6, 0);
    goto LAB6;

}

static void work_a_3056889143_3212880686_p_1(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;

LAB0:    xsi_set_current_line(29, ng0);

LAB3:    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 5728U);
    t4 = ieee_p_1242562249_sub_2045698577_1035706684(IEEE_P_1242562249, t1, t3, t2, 32);
    t5 = (t1 + 12U);
    t6 = *((unsigned int *)t5);
    t6 = (t6 * 1U);
    t7 = (32U != t6);
    if (t7 == 1)
        goto LAB5;

LAB6:    t8 = (t0 + 3824);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t4, 32U);
    xsi_driver_first_trans_fast(t8);

LAB2:    t13 = (t0 + 3664);
    *((int *)t13) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t6, 0);
    goto LAB6;

}

static void work_a_3056889143_3212880686_p_2(char *t0)
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
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(33, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t10 = (t0 + 1512U);
    t11 = *((char **)t10);
    t10 = (t0 + 3888);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t11, 32U);
    xsi_driver_first_trans_fast_port(t10);

LAB2:    t16 = (t0 + 3680);
    *((int *)t16) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 1672U);
    t5 = *((char **)t1);
    t1 = (t0 + 3888);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 32U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB6:    goto LAB2;

}


extern void work_a_3056889143_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3056889143_3212880686_p_0,(void *)work_a_3056889143_3212880686_p_1,(void *)work_a_3056889143_3212880686_p_2};
	xsi_register_didat("work_a_3056889143_3212880686", "isim/procTEST_isim_beh.exe.sim/work/a_3056889143_3212880686.didat");
	xsi_register_executes(pe);
}
