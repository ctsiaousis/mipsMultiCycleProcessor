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

entity ifBOXadder is
    Port ( pc_addr : in  STD_LOGIC_VECTOR (31 downto 0);
           immed : in  STD_LOGIC_VECTOR (31 downto 0);
           out_immed : out  STD_LOGIC_VECTOR (31 downto 0);
			  jumpAround : in std_logic;
           out_4 : out  STD_LOGIC_VECTOR (31 downto 0));
end ifBOXadder;

architecture Behavioral of ifBOXadder is

signal localAddress : unsigned(31 downto 0);

begin
localAddress <= unsigned(pc_addr);



--process(immed)
--begin
--	if immed /= x"00000000" then
--		out_immed <= std_logic_vector((localAddress + 4) + unsigned(immed));
--	else out_immed <= x"00000000";
--	end if;
--end process;

out_immed <= std_logic_vector((localAddress + 4) + unsigned(immed)) when 
						(jumpAround = '0') else std_logic_vector((localAddress + 4) + shift_left(unsigned(immed), 2)) ;
out_4 <= std_logic_vector(localAddress + 4);
end Behavioral;

