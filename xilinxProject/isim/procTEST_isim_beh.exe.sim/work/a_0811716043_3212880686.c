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
static const char *ng0 = "U:/6o/ORGANWSH/LAB4/LAB4_impl/dec2to4.vhd";



static void work_a_0811716043_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned char t18;
    unsigned int t19;
    char *t20;
    char *t21;
    char *t22;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    unsigned char t32;
    unsigned int t33;
    char *t34;
    char *t35;
    char *t36;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    unsigned char t46;
    unsigned int t47;
    char *t48;
    char *t49;
    char *t50;
    char *t52;
    char *t53;
    char *t54;
    char *t55;
    char *t56;
    char *t57;
    char *t59;
    char *t60;
    char *t61;
    char *t62;
    char *t63;
    char *t64;

LAB0:    xsi_set_current_line(23, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 4262);
    t4 = 1;
    if (2U == 2U)
        goto LAB5;

LAB6:    t4 = 0;

LAB7:    if (t4 != 0)
        goto LAB3;

LAB4:    t15 = (t0 + 1032U);
    t16 = *((char **)t15);
    t15 = (t0 + 4268);
    t18 = 1;
    if (2U == 2U)
        goto LAB13;

LAB14:    t18 = 0;

LAB15:    if (t18 != 0)
        goto LAB11;

LAB12:    t29 = (t0 + 1032U);
    t30 = *((char **)t29);
    t29 = (t0 + 4274);
    t32 = 1;
    if (2U == 2U)
        goto LAB21;

LAB22:    t32 = 0;

LAB23:    if (t32 != 0)
        goto LAB19;

LAB20:    t43 = (t0 + 1032U);
    t44 = *((char **)t43);
    t43 = (t0 + 4280);
    t46 = 1;
    if (2U == 2U)
        goto LAB29;

LAB30:    t46 = 0;

LAB31:    if (t46 != 0)
        goto LAB27;

LAB28:
LAB35:    t57 = (t0 + 4286);
    t59 = (t0 + 2752);
    t60 = (t59 + 56U);
    t61 = *((char **)t60);
    t62 = (t61 + 56U);
    t63 = *((char **)t62);
    memcpy(t63, t57, 4U);
    xsi_driver_first_trans_fast_port(t59);

LAB2:    t64 = (t0 + 2672);
    *((int *)t64) = 1;

LAB1:    return;
LAB3:    t8 = (t0 + 4264);
    t10 = (t0 + 2752);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t8, 4U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB2;

LAB5:    t5 = 0;

LAB8:    if (t5 < 2U)
        goto LAB9;
    else
        goto LAB7;

LAB9:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB6;

LAB10:    t5 = (t5 + 1);
    goto LAB8;

LAB11:    t22 = (t0 + 4270);
    t24 = (t0 + 2752);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memcpy(t28, t22, 4U);
    xsi_driver_first_trans_fast_port(t24);
    goto LAB2;

LAB13:    t19 = 0;

LAB16:    if (t19 < 2U)
        goto LAB17;
    else
        goto LAB15;

LAB17:    t20 = (t16 + t19);
    t21 = (t15 + t19);
    if (*((unsigned char *)t20) != *((unsigned char *)t21))
        goto LAB14;

LAB18:    t19 = (t19 + 1);
    goto LAB16;

LAB19:    t36 = (t0 + 4276);
    t38 = (t0 + 2752);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    t41 = (t40 + 56U);
    t42 = *((char **)t41);
    memcpy(t42, t36, 4U);
    xsi_driver_first_trans_fast_port(t38);
    goto LAB2;

LAB21:    t33 = 0;

LAB24:    if (t33 < 2U)
        goto LAB25;
    else
        goto LAB23;

LAB25:    t34 = (t30 + t33);
    t35 = (t29 + t33);
    if (*((unsigned char *)t34) != *((unsigned char *)t35))
        goto LAB22;

LAB26:    t33 = (t33 + 1);
    goto LAB24;

LAB27:    t50 = (t0 + 4282);
    t52 = (t0 + 2752);
    t53 = (t52 + 56U);
    t54 = *((char **)t53);
    t55 = (t54 + 56U);
    t56 = *((char **)t55);
    memcpy(t56, t50, 4U);
    xsi_driver_first_trans_fast_port(t52);
    goto LAB2;

LAB29:    t47 = 0;

LAB32:    if (t47 < 2U)
        goto LAB33;
    else
        goto LAB31;

LAB33:    t48 = (t44 + t47);
    t49 = (t43 + t47);
    if (*((unsigned char *)t48) != *((unsigned char *)t49))
        goto LAB30;

LAB34:    t47 = (t47 + 1);
    goto LAB32;

LAB36:    goto LAB2;

}


extern void work_a_0811716043_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0811716043_3212880686_p_0};
	xsi_register_didat("work_a_0811716043_3212880686", "isim/procTEST_isim_beh.exe.sim/work/a_0811716043_3212880686.didat");
	xsi_register_executes(pe);
}
