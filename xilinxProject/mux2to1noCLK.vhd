library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2to1noCLK is
generic(N : integer := 31);
    Port ( in0 : in  STD_LOGIC_vector(N downto 0);
           in1 : in  STD_LOGIC_vector(N downto 0);
			  sel : in STD_logic;
           output : out  STD_LOGIC_vector(N downto 0));
end Mux2to1noCLK;

architecture Behavioral of Mux2to1noCLK is
begin

output <= in1 when sel = '1' else in0 after 5 ns;

--	process(sel)
--	begin
--		case sel is
--			when '1' 	=> output <= in1;
--			when '0'    => output <= in0;
--			when others => output <= in0;
--		end case;
--	end process;

end Behavioral;