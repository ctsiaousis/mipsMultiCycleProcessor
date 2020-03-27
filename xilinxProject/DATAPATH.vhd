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

entity DATAPATH is
    Port ( CLK : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           ALU_Bin_SEL : in  STD_LOGIC;
           RF_WrData_SEL : in  STD_LOGIC;
			  RF_WR_EN : in  STD_LOGIC;
           RF_B_SEL : in  STD_LOGIC;
           EXT_OP : in  STD_LOGIC;
           PC_SEL : in  STD_LOGIC;
           EPCsel : in  STD_LOGIC; --
           CAUsel : in  STD_LOGIC; --
           EPCen  : in  STD_LOGIC; --
           MVsel  : in  STD_LOGIC; --
			  byte_op : in std_logic;
           PC_LdEn : in  STD_LOGIC;
			  BR_IM_S : in std_logic;
			  ZERO	 : out std_logic;
			  MEXC	 : out std_logic;
			  INSTR	 : out std_logic_vector(31 downto 0);
			  CAUreg	 : in std_logic_vector(31 downto 0); --
			  hdlADDR : in std_logic_vector(31 downto 0); --
			  ALU_FUNCTION : in std_logic_vector(3 downto 0);
           MEM_WrEN : in  STD_LOGIC);
end DATAPATH;

architecture Behavioral of DATAPATH is
	
	component IFbox is
    Port ( PC_Immed : in  STD_LOGIC_VECTOR (31 downto 0);
			  fromEPC : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_sel : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           fsmSEL : in  STD_LOGIC;
			  handlerSEL : in std_logic;								-----
			  handlerADDR: in std_logic_vector(31 downto 0); -----
			  branch : in std_logic;
           PC_out : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	component  memoryBOX is
    Port ( clk : in  STD_LOGIC;
           Mem_WrEn : in  STD_LOGIC;
           exc : out  STD_LOGIC;
           ALU_MEM_Addr : in  STD_LOGIC_VECTOR (10 downto 0);
           ALU_MEM_EXC  : in  STD_LOGIC_VECTOR (10 downto 0);
           MEM_DataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataOut : out  STD_LOGIC_VECTOR (31 downto 0);
			  INST_Addr : in std_logic_vector(10 downto 0);
			  INST_DataOut : out STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	component DECODEbox is
    Port ( Instr : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_WrEn : in  STD_LOGIC;
           ALU_out : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_out : in  STD_LOGIC_VECTOR (31 downto 0);
           CAUreg  : in  STD_LOGIC_VECTOR (31 downto 0);
           CAUsel  : in  STD_LOGIC;
           RF_WrData_sel : in  STD_LOGIC;
           RF_B_sel : in  STD_LOGIC;
           CLOCK : in  STD_LOGIC;
			  EXT_op : in std_logic; --zero/sign fill control
			  Byte_s : in std_logic; --zero/sign fill control
           Immed : out  STD_LOGIC_VECTOR (31 downto 0);
           RF_A : out  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : out  STD_LOGIC_VECTOR (31 downto 0);
			  RST : in std_logic);
	end component;
	
	component ALUbox is
    Port ( RF_A : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : in  STD_LOGIC_VECTOR (31 downto 0);
           Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_Bin_Sel : in  STD_LOGIC;
           ALU_Func : in  STD_LOGIC_VECTOR (3 downto 0);
			  Zero		:out std_logic;
           ALU_out : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	component genericREG is
	generic(N : integer := 31);
    Port ( Data : in  STD_LOGIC_VECTOR (N downto 0);
           writeEnable : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (N downto 0);
			  Reset : in std_logic);
	end component;
	
	component exceptionHANDLER is
    Port ( CLK : in  STD_LOGIC;
			  RST : in  STD_LOGIC;
			  FSMsel : in  STD_LOGIC;
			  EPC_EN : in  STD_LOGIC;
			  EPC : in std_logic_vector(31 downto 0);
			  CAU : in std_logic_vector(31 downto 0);
			  handlerADDR : in std_logic_vector(31 downto 0);
			  Eout : out std_logic_vector(31 downto 0);
			  toMEM : out std_logic_vector(31 downto 0);
			  Cout : out std_logic_vector(31 downto 0));
	end component;
	
signal pcOUT, memoryOUT, instruction, aluOUT, immediate : std_logic_vector(31 downto 0);
signal signal_RF_A, signal_RF_B, FROMEPC : std_logic_vector(31 downto 0);
signal ALUtoREG, MEMtoREG, INSTtoREG, AtoREG, BtoREG,IMtoREG : std_logic_vector(31 downto 0);
signal fromCAUSE, handlerToMEM : std_logic_vector(31 downto 0);
signal hSEL : std_logic;
	
begin
handler : exceptionHANDLER
		port map(CLK			=> CLK,
					RST			=> Reset,
					FSMsel		=> CAUsel,
					EPC_EN		=> EPCen,
					EPC			=> pcOUT,
					CAU			=> CAUreg,
					handlerADDR	=> hdlADDR,
					Eout			=> FROMEPC,
					toMEM			=> handlerToMEM,
					Cout			=> fromCAUSE);

aluSTAGE : ALUbox
		port map(RF_A			=> signal_RF_A,
					RF_B			=> signal_RF_B,
					Immed			=> immediate,
					ALU_Bin_Sel => ALU_Bin_SEL,
					ALU_Func		=> ALU_FUNCTION, 
					Zero			=>	ZERO,
					ALU_out		=> ALUtoREG);
					
aluREG : genericREG
		port map(Data			=> ALUtoREG,
					writeEnable	=> '1',
					CLK			=> CLK,
					Dout			=> aluOUT,
					Reset			=> Reset);

docodeSTAGE : DECODEbox
		port map(Instr				=> instruction,
					RF_WrEn			=> RF_WR_EN,
					ALU_out			=> aluOUT,
					MEM_out			=> memoryOUT,
					CAUreg			=> fromCAUSE,
					CAUsel			=> MVsel,
					RF_WrData_sel	=> RF_WrData_SEL,
					RF_B_sel			=> RF_B_SEL,
					CLOCK				=> CLK,
					EXT_op			=> EXT_OP,
					Byte_s			=> byte_op,
					Immed				=> IMtoREG,
					RF_A				=> AtoREG,
					RF_B				=> BtoREG,
					RST				=> Reset);
	
ImmedREG : genericREG
		port map(Data			=> IMtoREG,
					writeEnable	=> '1',
					CLK			=> CLK,
					Dout			=> immediate,
					Reset			=> Reset);

BREG : genericREG
		port map(Data			=> BtoREG,
					writeEnable	=> '1',
					CLK			=> CLK,
					Dout			=> signal_RF_B,
					Reset			=> Reset);
					
AREG : genericREG
		port map(Data			=> AtoREG,
					writeEnable	=> '1',
					CLK			=> CLK,
					Dout			=> signal_RF_A,
					Reset			=> Reset);

memorySTAGE : memoryBOX
		port map(clk			=> CLK,
					Mem_WrEn		=> MEM_WrEN,
					exc			=> MEXC,
					ALU_MEM_Addr=> aluOUT(12 downto 2), ---------
					ALU_MEM_EXC	=> ALUtoREG(12 downto 2),
					MEM_DataIn	=> signal_RF_B,
					MEM_DataOut => MEMtoREG,
					INST_Addr	=> pcOUT(12 downto 2),--apo ton EXCHDL
					INST_DataOut=> INSTtoREG);
					
memREG : genericREG
		port map(Data			=> MEMtoREG,
					writeEnable	=> '1',
					CLK			=> CLK,
					Dout			=> memoryOUT,
					Reset			=> Reset);
					
instREG : genericREG
		port map(Data			=> INSTtoREG,
					writeEnable	=> '1',
					CLK			=> CLK,
					Dout			=> instruction,
					Reset			=> Reset);

ifSTAGE : IFbox
		port map(PC_Immed		=> immediate,
					fromEPC		=> FROMEPC,
					PC_sel		=> PC_SEL,
					PC_LdEn		=> PC_LdEn,
					Reset			=> Reset,
					CLK			=> CLK,
					fsmSEL		=> EPCsel,
					handlerSEL  => CAUsel,								-----
					handlerADDR => handlerToMEM,
					branch		=> BR_IM_S,
					PC_out		=> pcOUT);
					
INSTR <= INSTtoREG;

end Behavioral;

