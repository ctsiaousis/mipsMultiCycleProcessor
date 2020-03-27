---------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PROCESSOR is
	Port ( Reset : in std_logic;
			 Clock : in std_logic);
end PROCESSOR;

architecture Behavioral of PROCESSOR is


component DATAPATH is
    Port ( CLK : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           ALU_Bin_SEL : in  STD_LOGIC;
           RF_WrData_SEL : in  STD_LOGIC;
			  RF_WR_EN : in  STD_LOGIC;
           RF_B_SEL : in  STD_LOGIC;
           EXT_OP : in  STD_LOGIC;
           PC_SEL : in  STD_LOGIC;
           EPCsel : in  STD_LOGIC; ------
           CAUsel : in  STD_LOGIC; ------
           EPCen  : in  STD_LOGIC; ------
           MVsel  : in  STD_LOGIC; ------
			  byte_op : in std_logic;
           PC_LdEn : in  STD_LOGIC;
			  BR_IM_S : in std_logic;
			  ZERO	 : out std_logic;
			  MEXC	 : out std_logic;
			  INSTR	 : out std_logic_vector(31 downto 0);
			  CAUreg	 : in std_logic_vector(31 downto 0); ------
			  hdlADDR : in std_logic_vector(31 downto 0); ------
			  ALU_FUNCTION : in std_logic_vector(3 downto 0);
           MEM_WrEN : in  STD_LOGIC);

end component;

component CONTROL_fsm is
    Port ( RST : in  STD_LOGIC;
           INST : in  STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC;
			  zero : in STD_LOGIC;
			  exc : in STD_LOGIC;
			  ALU_B_SEL : out  STD_LOGIC;
			  EPC_SEL : out  STD_LOGIC; -------
			  CAUSE_SEL : out  STD_LOGIC; -------
           EPC_EN : out  STD_LOGIC; --------
           MV_SEL : out  STD_LOGIC; ----
           RF_WrData_S : out  STD_LOGIC;
			  RF_Wr_EN : out  STD_LOGIC;
           RF_B_S : out  STD_LOGIC;
           Extend_OP : out  STD_LOGIC;
			  byte_op : out std_logic;
           PC_SEL : out  STD_LOGIC;
           PC_En : out  STD_LOGIC;
			  Branch_S : out std_logic;
			  CAUSE_VALUE : out std_logic_vector(31 downto 0); -----
			  HANDLE_ADDR : out std_logic_vector(31 downto 0); -----
			  ALU_FUNC : out std_logic_vector(3 downto 0);
           MEM_WrEN : out  STD_LOGIC);
end component;
		 ---------------------------------------
signal EPC_SELECT,CAU_SELECT,EPC_EN,moveSELECT,aluSEL,RFdataSEL,RFwrEN,RFbSEL,extOP,byteOP,pcSEL,pcEN,branch,memEN,zr : std_logic;
signal aluF : std_logic_vector(3 downto 0);
signal memoryEXC : std_logic;
signal handleADDR,causeVAL,instruction : std_logic_vector(31 downto 0);

begin
nerd : CONTROL_fsm
		port map(RST			=> Reset,
					INST 			=> instruction,
					CLK			=> Clock,
					zero			=> zr,
					exc			=> memoryEXC,
					ALU_B_SEL	=> aluSEL,
					EPC_SEL	 	=> EPC_SELECT, -------
					CAUSE_SEL 	=> CAU_SELECT, -------
					EPC_EN 		=> EPC_EN,	 --------
					MV_SEL		=> moveSELECT, ----
					RF_WrData_S	=> RFdataSEL,
					RF_Wr_EN		=> RFwrEN,
					RF_B_S		=> RFbSEL,
					Extend_OP	=> extOP,
					byte_op		=> byteOP,
					PC_SEL		=> pcSEL,
					PC_En			=> pcEN,
					Branch_S		=> branch,
					CAUSE_VALUE => causeVAL,-----
					HANDLE_ADDR => handleADDR, -----
					ALU_FUNC		=> aluF,
					MEM_WrEn		=> memEN);

path : DATAPATH
		port map(CLK				=> Clock,
					Reset				=> Reset,
					ALU_Bin_SEL 	=> aluSEL,
					RF_WrData_SEL	=> RFdataSEL,
					RF_WR_EN			=>	RFwrEN,
					RF_B_SEL			=> RFbSEL,
					EXT_OP			=> extOP,
					PC_SEL			=> pcSEL,
					EPCsel			=> EPC_SELECT, ----------
					CAUsel			=> CAU_SELECT, ------------
					EPCen  			=> EPC_EN, -----
					MVsel				=> moveSELECT,
					byte_op			=> byteOP,
					PC_LdEn			=> pcEN,
					BR_IM_S			=> branch,
					ZERO				=> zr,
					MEXC				=> memoryEXC,
					INSTR				=> instruction,
					CAUreg	 		=> causeVAL, ------
					hdlADDR 			=> handleADDR,-----
					ALU_FUNCTION	=> aluF,
					MEM_WrEn			=> memEN);


end Behavioral;

