
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

entity dec3to8 is
    Port ( i : in  STD_LOGIC_VECTOR (2 downto 0);
           EN : in  STD_LOGIC;
           outV : out  STD_LOGIC_VECTOR (7 downto 0));
end dec3to8;

architecture Behavioral of dec3to8 is

begin
	decodTO8 : process(EN, i)
	begin
		if EN = '1' then
			case i is
				when "000" => outV <= "00000001";
				when "001" => outV <= "00000010";
				when "010" => outV <= "00000100";
				when "011" => outV <= "00001000";
				when "100" => outV <= "00010000";
				when "101" => outV <= "00100000";
				when "110" => outV <= "01000000";
				when "111" => outV <= "10000000";
				when others => outV <= "00000000";
			end case;
		elsif EN = '0' then
			outV <= "00000000";
		end if;
	end process decodTO8;

end Behavioral;

