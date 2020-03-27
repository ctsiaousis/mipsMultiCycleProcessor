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

entity ByteMaker is
    Port ( Din : in  STD_LOGIC_VECTOR (31 downto 0);
			  sel : in std_logic;
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end ByteMaker;

architecture Behavioral of ByteMaker is

signal tmp1, tmp2 : std_logic_vector(31 downto 0);

begin
tmp2 <= "11111111111111111111111100000000";
tmp1 <= tmp2 or Din;

Dout <= Din when sel = '0' else tmp1 after 5 ns;

end Behavioral;

