---------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity add0x400 is
    Port ( I : in  STD_LOGIC_VECTOR (10 downto 0);
			  C : in std_logic_VECTOR (10 downto 0);
			  E : out std_logic;
           O : out  STD_LOGIC_VECTOR (10 downto 0));
end add0x400;

architecture Behavioral of add0x400 is

begin

O <= std_logic_vector(unsigned(I) + 1024);

E <= '1' when (unsigned(I) > 1024) else '0';

end Behavioral;

