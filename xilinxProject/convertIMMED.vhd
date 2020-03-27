---------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_signed.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity extender is
    Port ( instr : in  STD_LOGIC_VECTOR (15 downto 0);
			  ExtOp : in std_logic;
           o : out  STD_LOGIC_VECTOR (31 downto 0));
end extender;

architecture Behavioral of extender is

signal tmp1 : signed(31 downto 0);
signal tmp2 : unsigned(31 downto 0);

begin
tmp1 <= resize(signed(instr), 32);
tmp2 <= resize(unsigned(instr), 32);


--otan to sima einai 0 exo 0fill
o <= std_logic_vector(tmp2) when ExtOp = '0'
	else	std_logic_vector(tmp1); --otan 1 exo epektasi prosimou

end Behavioral;

