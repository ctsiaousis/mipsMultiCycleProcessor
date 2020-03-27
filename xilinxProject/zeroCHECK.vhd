----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity zeroCHECK is
    Port ( inputA : in  STD_LOGIC_VECTOR (31 downto 0);
           zeroSignal : out  STD_LOGIC);
end zeroCHECK;

architecture Behavioral of zeroCHECK is
signal tmp : boolean;
begin

zeroSignal <= '1' when inputA = "00000000000000000000000000000000" else '0';

end Behavioral;

