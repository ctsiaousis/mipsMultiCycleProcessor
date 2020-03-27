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
static const char *ng0 = "U:/6o/ORGANWSH/LAB4/LAB4_impl/arithBOX.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

char *ieee_p_1242562249_sub_1547198987_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_1547270861_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_2045698577_1035706684(char *, char *, char *, char *, int );
unsigned char ieee_p_2592010699_sub_1605435078_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );
unsigned char ieee_p_2592010699_sub_2507238156_503743352(char *, unsigned char , unsigned char );


static void work_a_0945232442_3212880686_p_0(char *t0)
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
    t2 = (t0 + 8796U);
    t4 = ieee_p_1242562249_sub_2045698577_1035706684(IEEE_P_1242562249, t1, t3, t2, 33);
    t5 = (t1 + 12U);
    t6 = *((unsigned int *)t5);
    t6 = (t6 * 1U);
    t7 = (33U != t6);
    if (t7 == 1)
        goto LAB5;

LAB6:    t8 = (t0 + 6040);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t4, 33U);
    xsi_driver_first_trans_fast(t8);

LAB2:    t13 = (t0 + 5848);
    *((int *)t13) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(33U, t6, 0);
    goto LAB6;

}

static void work_a_0945232442_3212880686_p_1(char *t0)
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

LAB0:    xsi_set_current_line(30, ng0);

LAB3:    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 8812U);
    t4 = ieee_p_1242562249_sub_2045698577_1035706684(IEEE_P_1242562249, t1, t3, t2, 33);
    t5 = (t1 + 12U);
    t6 = *((unsigned int *)t5);
    t6 = (t6 * 1U);
    t7 = (33U != t6);
    if (t7 == 1)
        goto LAB5;

LAB6:    t8 = (t0 + 6104);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t4, 33U);
    xsi_driver_first_trans_fast(t8);

LAB2:    t13 = (t0 + 5864);
    *((int *)t13) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(33U, t6, 0);
    goto LAB6;

}

static void work_a_0945232442_3212880686_p_2(char *t0)
{
    char t5[16];
    char t19[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned char t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    unsigned char t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;

LAB0:    xsi_set_current_line(31, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB7:    t20 = (t0 + 2152U);
    t21 = *((char **)t20);
    t20 = (t0 + 8844U);
    t22 = (t0 + 2312U);
    t23 = *((char **)t22);
    t22 = (t0 + 8844U);
    t24 = ieee_p_1242562249_sub_1547270861_1035706684(IEEE_P_1242562249, t19, t21, t20, t23, t22);
    t25 = (t19 + 12U);
    t26 = *((unsigned int *)t25);
    t27 = (1U * t26);
    t28 = (33U != t27);
    if (t28 == 1)
        goto LAB9;

LAB10:    t29 = (t0 + 6168);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    memcpy(t33, t24, 33U);
    xsi_driver_first_trans_fast(t29);

LAB2:    t34 = (t0 + 5880);
    *((int *)t34) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 2152U);
    t6 = *((char **)t1);
    t1 = (t0 + 8844U);
    t7 = (t0 + 2312U);
    t8 = *((char **)t7);
    t7 = (t0 + 8844U);
    t9 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t5, t6, t1, t8, t7);
    t10 = (t5 + 12U);
    t11 = *((unsigned int *)t10);
    t12 = (1U * t11);
    t13 = (33U != t12);
    if (t13 == 1)
        goto LAB5;

LAB6:    t14 = (t0 + 6168);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t9, 33U);
    xsi_driver_first_trans_fast(t14);
    goto LAB2;

LAB5:    xsi_size_not_matching(33U, t12, 0);
    goto LAB6;

LAB8:    goto LAB2;

LAB9:    xsi_size_not_matching(33U, t27, 0);
    goto LAB10;

}

static void work_a_0945232442_3212880686_p_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(34, ng0);

LAB3:    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t1 = (t0 + 6232);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 33U);
    xsi_driver_first_trans_fast(t1);

LAB2:    t7 = (t0 + 5896);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0945232442_3212880686_p_4(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned char t17;
    unsigned char t18;
    char *t19;
    char *t20;
    int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned char t25;
    char *t26;
    char *t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned char t32;
    unsigned char t33;
    unsigned char t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned char t46;
    unsigned char t47;
    char *t48;
    char *t49;
    int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned char t54;
    unsigned char t55;
    char *t56;
    char *t57;
    int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned char t62;
    char *t63;
    char *t64;
    int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned char t69;
    unsigned char t70;
    unsigned char t71;
    char *t72;
    char *t73;
    char *t74;
    char *t75;
    char *t76;
    char *t77;

LAB0:    xsi_set_current_line(35, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t40 = (t0 + 1032U);
    t41 = *((char **)t40);
    t42 = (31 - 31);
    t43 = (t42 * -1);
    t44 = (1U * t43);
    t45 = (0 + t44);
    t40 = (t41 + t45);
    t46 = *((unsigned char *)t40);
    t47 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t46);
    t48 = (t0 + 1192U);
    t49 = *((char **)t48);
    t50 = (31 - 31);
    t51 = (t50 * -1);
    t52 = (1U * t51);
    t53 = (0 + t52);
    t48 = (t49 + t53);
    t54 = *((unsigned char *)t48);
    t55 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t47, t54);
    t56 = (t0 + 2472U);
    t57 = *((char **)t56);
    t58 = (31 - 32);
    t59 = (t58 * -1);
    t60 = (1U * t59);
    t61 = (0 + t60);
    t56 = (t57 + t61);
    t62 = *((unsigned char *)t56);
    t63 = (t0 + 1032U);
    t64 = *((char **)t63);
    t65 = (31 - 31);
    t66 = (t65 * -1);
    t67 = (1U * t66);
    t68 = (0 + t67);
    t63 = (t64 + t68);
    t69 = *((unsigned char *)t63);
    t70 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t62, t69);
    t71 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t55, t70);
    t72 = (t0 + 6296);
    t73 = (t72 + 56U);
    t74 = *((char **)t73);
    t75 = (t74 + 56U);
    t76 = *((char **)t75);
    *((unsigned char *)t76) = t71;
    xsi_driver_first_trans_fast(t72);

LAB2:    t77 = (t0 + 5912);
    *((int *)t77) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 1032U);
    t5 = *((char **)t1);
    t6 = (31 - 31);
    t7 = (t6 * -1);
    t8 = (1U * t7);
    t9 = (0 + t8);
    t1 = (t5 + t9);
    t10 = *((unsigned char *)t1);
    t11 = (t0 + 1192U);
    t12 = *((char **)t11);
    t13 = (31 - 31);
    t14 = (t13 * -1);
    t15 = (1U * t14);
    t16 = (0 + t15);
    t11 = (t12 + t16);
    t17 = *((unsigned char *)t11);
    t18 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t10, t17);
    t19 = (t0 + 2472U);
    t20 = *((char **)t19);
    t21 = (31 - 32);
    t22 = (t21 * -1);
    t23 = (1U * t22);
    t24 = (0 + t23);
    t19 = (t20 + t24);
    t25 = *((unsigned char *)t19);
    t26 = (t0 + 1192U);
    t27 = *((char **)t26);
    t28 = (31 - 31);
    t29 = (t28 * -1);
    t30 = (1U * t29);
    t31 = (0 + t30);
    t26 = (t27 + t31);
    t32 = *((unsigned char *)t26);
    t33 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t25, t32);
    t34 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t18, t33);
    t35 = (t0 + 6296);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    t38 = (t37 + 56U);
    t39 = *((char **)t38);
    *((unsigned char *)t39) = t34;
    xsi_driver_first_trans_fast(t35);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_0945232442_3212880686_p_5(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(37, ng0);

LAB3:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t3 = (32 - 31);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 6360);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 32U);
    xsi_driver_first_trans_fast_port(t6);

LAB2:    t11 = (t0 + 5928);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0945232442_3212880686_p_6(char *t0)
{
    int64 t1;
    char *t2;
    char *t3;
    int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(38, ng0);

LAB3:    t1 = (10 * 1000LL);
    t2 = (t0 + 2472U);
    t3 = *((char **)t2);
    t4 = (32 - 32);
    t5 = (t4 * -1);
    t6 = (1U * t5);
    t7 = (0 + t6);
    t2 = (t3 + t7);
    t8 = *((unsigned char *)t2);
    t9 = (t0 + 6424);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = t8;
    xsi_driver_first_trans_delta(t9, 0U, 1, t1);
    t14 = (t0 + 6424);
    xsi_driver_intertial_reject(t14, t1, t1);

LAB2:    t15 = (t0 + 5944);
    *((int *)t15) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0945232442_3212880686_p_7(char *t0)
{
    int64 t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    xsi_set_current_line(39, ng0);

LAB3:    t1 = (10 * 1000LL);
    t2 = (t0 + 2632U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t2 = (t0 + 6488);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t4;
    xsi_driver_first_trans_delta(t2, 0U, 1, t1);
    t9 = (t0 + 6488);
    xsi_driver_intertial_reject(t9, t1, t1);

LAB2:    t10 = (t0 + 5960);
    *((int *)t10) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_0945232442_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0945232442_3212880686_p_0,(void *)work_a_0945232442_3212880686_p_1,(void *)work_a_0945232442_3212880686_p_2,(void *)work_a_0945232442_3212880686_p_3,(void *)work_a_0945232442_3212880686_p_4,(void *)work_a_0945232442_3212880686_p_5,(void *)work_a_0945232442_3212880686_p_6,(void *)work_a_0945232442_3212880686_p_7};
	xsi_register_didat("work_a_0945232442_3212880686", "isim/procTEST_isim_beh.exe.sim/work/a_0945232442_3212880686.didat");
	xsi_register_executes(pe);
}
