----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( inputA : in  STD_LOGIC_VECTOR (31 downto 0);
           inputB : in  STD_LOGIC_VECTOR (31 downto 0);
           OP : in  STD_LOGIC_VECTOR (3 downto 0);
           ZERO : out  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC;
           OUTPUT : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is
	
		 component arithBOX is
		 Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
				  B : in  STD_LOGIC_VECTOR (31 downto 0);
				  operation : in STD_LOGIC; --lsb tou OP
				  output : out  STD_LOGIC_VECTOR (31 downto 0);
				  cout : out  STD_LOGIC;
				  overflow : out  STD_LOGIC);
		end component;


		component logicBOX is
		Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
				 B : in  STD_LOGIC_VECTOR (31 downto 0);
				 output : out  STD_LOGIC_VECTOR (31 downto 0);
				 sel : in  STD_LOGIC_VECTOR (2 downto 0));
		end component;


		component shiftBOX is
		Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
				 output : out  STD_LOGIC_VECTOR (31 downto 0);
			    sel : in std_logic_vector(2 downto 0));
		end component;
		
		
		component aluMUX is
		Port ( AR : in  STD_LOGIC_VECTOR (31 downto 0);
				 LO : in  STD_LOGIC_VECTOR (31 downto 0);
				 SH : in  STD_LOGIC_VECTOR (31 downto 0);
				 nOUT : out  STD_LOGIC_VECTOR (31 downto 0);
				 slct : in  STD_LOGIC_VECTOR (1 downto 0));
		end component;
		
		component zeroCHECK is
		Port ( inputA : in  STD_LOGIC_VECTOR (31 downto 0);
				 zeroSignal : out  STD_LOGIC);
		end component;

signal fromAR, fromLO, fromSH, tmpOUT : std_logic_vector(31 downto 0);
signal muxSEL : std_logic_vector(1 downto 0);
signal ovcoEN, tmpOVF, tmpCout : std_logic;
begin
muxSEL(1) <= OP(3);
muxSEL(0) <= (not(OP(3)) and (OP(2) or OP(1)));

ovcoEN	 <= muxSEL(1) nor muxSEL(0);

chk : zeroCHECK
		port map(inputA => tmpOUT,
					zeroSignal => ZERO);

MUX : aluMUX
		port map(AR => fromAR,
					LO => fromLO,
					SH => fromSH,
					nOUT => tmpOUT,
					slct => muxSEL);

shift : shiftBOX 
		port map(A => inputA,
					output => fromSH,
					sel => OP(2 downto 0));

logic : logicBOX
		port map(A => inputA,
					B => inputB,
					output => fromLO,
					sel => OP(2 downto 0));

math : arithBOX
		port map(A => inputA,
					B => inputB,
					operation => OP(0),
					output => fromAR,
					cout => tmpCout,
					overflow => tmpOVF);
					
Ovf 	<= tmpOVF and ovcoEN;
Cout	<= tmpCout and ovcoEN;
OUTPUT<= tmpOUT;

end Behavioral;

