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

entity aluMUX is
    Port ( AR : in  STD_LOGIC_VECTOR (31 downto 0);
           LO : in  STD_LOGIC_VECTOR (31 downto 0);
           SH : in  STD_LOGIC_VECTOR (31 downto 0);
           nOUT : out  STD_LOGIC_VECTOR (31 downto 0);
           slct : in  STD_LOGIC_VECTOR (1 downto 0));
end aluMUX;

architecture Behavioral of aluMUX is
signal output :  STD_LOGIC_VECTOR (31 downto 0);

begin

	output <=AR when	(slct = "00") else
				LO when 	(slct = "01") else
				SH when 	(slct = "10") else
				"00000000000000000000000000000000";
				
nOUT <= output after 10 ns;

end Behavioral;

