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

entity RF is
    Port ( CLK : in  STD_LOGIC;
           writeEN : in  STD_LOGIC;
           AddrWR : in  STD_LOGIC_VECTOR (4 downto 0);
           DIN : in  STD_LOGIC_VECTOR (31 downto 0);
           AddrRD1 : in  STD_LOGIC_VECTOR (4 downto 0);
           AddrRD2 : in  STD_LOGIC_VECTOR (4 downto 0);
           out1 : out  STD_LOGIC_VECTOR (31 downto 0);
           out2 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reset : in std_logic);
end RF;

architecture Behavioral of RF is

		component noMuxBox is
    Port ( writeAD : in  STD_LOGIC_VECTOR (4 downto 0);
           CK : in  STD_LOGIC;
           wrEN : in  STD_LOGIC;
           dataIN : in  STD_LOGIC_VECTOR (31 downto 0);
           dataOUT : out  STD_LOGIC_VECTOR (1023 downto 0);
			  RST : in std_logic);
		end component;


		component mux32 is
    Port ( inputVector : in  STD_LOGIC_VECTOR (1023 downto 0);
           sel : in  STD_LOGIC_VECTOR (4 downto 0);
           outputVector : out  STD_LOGIC_VECTOR (31 downto 0));
		end component;

signal toMUX : std_logic_vector(1023 downto 0);
begin

box : noMuxBox
		port map(writeAD	=>AddrWR,
					CK			=>CLK,
					wrEN		=>writeEN,
					dataIN	=>DIN,
					dataOUT	=>toMUX,
					RST		=>Reset);
					
					
mux1 : mux32
		port map(inputVector		=>toMUX,
					sel				=>AddrRD1,
					outputVector	=>out1);

mux2 : mux32
		port map(inputVector		=>toMUX,
					sel				=>AddrRD2,
					outputVector	=>out2);

end Behavioral;

