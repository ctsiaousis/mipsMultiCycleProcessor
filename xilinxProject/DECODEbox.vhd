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

entity DECODEbox is
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
			  Byte_s : in std_logic; --load/store byte control
           Immed : out  STD_LOGIC_VECTOR (31 downto 0);
           RF_A : out  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : out  STD_LOGIC_VECTOR (31 downto 0);
			  RST : in std_logic);
end DECODEbox;

architecture Behavioral of DECODEbox is

	component RF is
		Port ( CLK : in  STD_LOGIC;
           writeEN : in  STD_LOGIC;
           AddrWR : in  STD_LOGIC_VECTOR (4 downto 0);
           DIN : in  STD_LOGIC_VECTOR (31 downto 0);
           AddrRD1 : in  STD_LOGIC_VECTOR (4 downto 0);
           AddrRD2 : in  STD_LOGIC_VECTOR (4 downto 0);
           out1 : out  STD_LOGIC_VECTOR (31 downto 0);
           out2 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reset : in std_logic);
	end component;
	
	
		component Mux2to1noCLK is
	generic(N : integer := 31);
		Port (in0 : in  STD_LOGIC_vector(N downto 0);
				in1 : in  STD_LOGIC_vector(N downto 0);
				sel : in STD_logic;
				output : out  STD_LOGIC_vector(N downto 0));
	end component;
	
	component extender is
    Port ( instr : in  STD_LOGIC_VECTOR (15 downto 0);
			  ExtOp : in std_logic;
           o : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	component ByteMaker is
    Port ( Din : in  STD_LOGIC_VECTOR (31 downto 0);
			  sel : in std_logic;
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
signal muxDATA, byteORNOT, dataIN : std_logic_vector(31 downto 0);
signal muxREG2 : std_logic_vector(4 downto 0);

begin
causeRD : Mux2to1noCLK
	generic map(N => 31)
		port map(in0	=>muxDATA,
					in1	=>CAUreg,
					sel	=>CAUsel,
					output=>dataIN);

bytezzzz : ByteMaker
		port map(Din  => MEM_out,
					sel  => Byte_s,
					Dout => byteORNOT);
					
registerFile : RF
		port map(CLK 		=> CLOCK,
					writeEN	=> RF_WrEn,
					AddrWr	=> Instr(20 downto 16),
					DIN		=> dataIN,
					AddrRD1	=> Instr(25 downto 21),
					AddrRD2	=> muxREG2,
					out1		=> RF_A,
					out2		=> RF_B,
					Reset		=> RST);
					
multi32plex : Mux2to1noCLK
	generic map (N => 31)
		port map(in0 	=> ALU_out,
					in1 	=> byteORNOT,
					sel 	=> RF_WrData_sel,
					output=> muxDATA);
					
multi5plex : Mux2to1noCLK
	generic map (N => 4)
		port map(in0	=> Instr(15 downto 11),
					in1	=> Instr(20 downto 16),
					sel	=> RF_B_sel,
					output=> muxREG2);
					
					
extndIMMED : extender
		port map(instr	=> Instr(15 downto 0),
					ExtOp => EXT_op,
					o		=> Immed);

end Behavioral;

