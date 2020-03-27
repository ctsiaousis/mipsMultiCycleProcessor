---------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use std.textio.all;
use ieee.std_logic_textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memory is
    Port ( inst_addr : in  STD_LOGIC_VECTOR (10 downto 0);
           inst_dout : out  STD_LOGIC_VECTOR (31 downto 0);
           data_we : in  STD_LOGIC;
           data_addr : in  STD_LOGIC_VECTOR (10 downto 0);
           data_din : in  STD_LOGIC_VECTOR (31 downto 0);
           data_dout : out  STD_LOGIC_VECTOR (31 downto 0);
			  clk			: in std_logic);
end memory;

architecture syn of memory is

type ram_type is array (2047 downto 0) of std_logic_vector (31 downto 0);

	impure function InitRamFromFile (RamFileName : in string) return ram_type is
	FILE ramfile : text is in RamFileName;
	variable RamFileLine : line;
	variable ram : ram_type;
	begin
	
		for i in 0 to 1023 loop
			readline(ramfile, RamFileLine);
			read (RamFileLine, ram(i));
		end loop;
		
		for i in 1024 to 2047 loop
			ram(i) := x"00000000";
		end loop;
		
	return ram;
	end function;
signal ram : ram_type := InitRamFromFile("ram2.data");

begin
	
	process (clk)
	begin
		if rising_edge(clk) then
			if data_we = '1' then
			ram(conv_integer(data_addr)) <= data_din;
			end if;
		end if;
	end process;
	
	data_dout <= ram(conv_integer(data_addr)) after 10ns;
	inst_dout <= ram(conv_integer(inst_addr)) after 10ns;
end syn;
