----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_signed.all;
--use ieee.std_logic_arith.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shiftBOX is
	 generic(
		constant N: integer := 1
	 );
	 
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0);
			  sel : in std_logic_vector(2 downto 0));
end shiftBOX;

architecture Behavioral of shiftBOX is

signal number, signA : signed(31 downto 0);
signal unsinA : unsigned(31 downto 0);
signal result : STD_LOGIC_VECTOR (31 downto 0);
begin
	signA <= signed(A);
	unsinA <= unsigned(A);


	process(A,sel)
	begin
		case(sel) is
			when "000" =>	result <= std_logic_vector(shift_right(signA, N));
			when "001" =>	result <= std_logic_vector(unsinA srl N);
			when "010" =>	result <= std_logic_vector(unsinA sll N);
			when "100" =>	result <= std_logic_vector(unsinA rol N);
			when "101" =>	result <= std_logic_vector(unsinA ror N);
			when others => result <= x"00000000";
		end case;
	end process;
			
	output <= result; --std_logic_vector(number);

end Behavioral;

