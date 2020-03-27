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

entity PC is
    Port ( Din : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_load : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end PC;

architecture Behavioral of PC is

begin

	procRegister : process(CLK)
	begin
		if rising_edge(CLK) then
			if Reset='1' then Dout <= x"00000000";
				elsif PC_load='1' then Dout<=Din after 5 ns;
				else null;
			end if;
		end if;
	end process procRegister;

end Behavioral;

