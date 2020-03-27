
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

entity dec2to4 is
    Port ( A : in  STD_LOGIC_VECTOR (1 downto 0);
           B : out  STD_LOGIC_VECTOR (3 downto 0));
end dec2to4;

architecture Behavioral of dec2to4 is

begin
B <=  "0001" when A = "00" else
		"0010" when A = "01" else
		"0100" when A = "10" else
		"1000" when A = "11" else
		"0000";

end Behavioral;

