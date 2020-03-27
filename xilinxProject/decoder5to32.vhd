----------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder5to32 is
    Port ( writeAddr : in  STD_LOGIC_VECTOR (4 downto 0);
           outAddr : out  STD_LOGIC_VECTOR (31 downto 0));
end decoder5to32;

architecture Behavioral of decoder5to32 is
	
	component dec2to4 is
		Port( A : in  STD_LOGIC_VECTOR (1 downto 0);
            B : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	
	component dec3to8 is
    Port ( i 		: in  STD_LOGIC_VECTOR (2 downto 0);
           EN 		: in  STD_LOGIC;
           outV 	: out  STD_LOGIC_VECTOR (7 downto 0));
	end component;


--signal B : std_logic_vector(4 downto 0);
signal toRegs 	: std_logic_vector(2 downto 0);
signal contrl 	: std_logic_vector(1 downto 0);
signal vectorEN: std_logic_vector(3 downto 0);
signal toOUT: std_logic_vector(31 downto 0);

begin
contrl <= writeAddr(4 downto 3);
toRegs <= writeAddr(2 downto 0);

mikros2se4 : dec2to4
		port map(A=>contrl,
					B=>vectorEN);
					
dec3 : dec3to8
		port map(i=>toRegs,
					EN=>vectorEN(3),
					outV=>toOUT(31 downto 24));
					
dec2 : dec3to8
		port map(i=>toRegs,
					EN=>vectorEN(2),
					outV=>toOUT(23 downto 16));
					
dec1 : dec3to8
		port map(i=>toRegs,
					EN=>vectorEN(1),
					outV=>toOUT(15 downto 8));
					
dec0 : dec3to8
		port map(i=>toRegs,
					EN=>vectorEN(0),
					outV=>toOUT(7 downto 0));
					
outADDR <= toOUT after 5 ns;

end Behavioral;

