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

entity mux32 is
    Port ( inputVector : in  STD_LOGIC_VECTOR (1023 downto 0);
           sel : in  STD_LOGIC_VECTOR (4 downto 0);
           outputVector : out  STD_LOGIC_VECTOR (31 downto 0));
end mux32;

architecture Behavioral of mux32 is

signal temp : STD_LOGIC_VECTOR (31 downto 0);

begin
temp			 <= inputVector(1023 downto 992) 	when (sel = "11111") else --31
					 inputVector(991 downto 960) 		when (sel = "11110") else --30
					 inputVector(959 downto 928)		when (sel = "11101") else --29
					 inputVector(927 downto 896) 		when (sel = "11100") else --28
					 inputVector(895 downto 864) 		when (sel = "11011") else
					 inputVector(863 downto 832) 		when (sel = "11010") else
					 inputVector(831 downto 800) 		when (sel = "11001") else --25
					 inputVector(799 downto 768) 		when (sel = "11000") else 
					 inputVector(767 downto 736) 		when (sel = "10111") else
					 inputVector(735 downto 704) 		when (sel = "10110") else --22
					 inputVector(703 downto 672) 		when (sel = "10101") else 
					 inputVector(671 downto 640) 		when (sel = "10100") else
					 inputVector(639 downto 608) 		when (sel = "10011") else --19
					 inputVector(607 downto 576) 		when (sel = "10010") else 
					 inputVector(575 downto 544) 		when (sel = "10001") else
					 inputVector(543 downto 512) 		when (sel = "10000") else
					 inputVector(511 downto 480) 		when (sel = "01111") else --15
					 inputVector(479 downto 448) 		when (sel = "01110") else
					 inputVector(447 downto 416) 		when (sel = "01101") else
					 inputVector(415 downto 384) 		when (sel = "01100") else --12
					 inputVector(383 downto 352) 		when (sel = "01011") else
					 inputVector(351 downto 320) 		when (sel = "01010") else
					 inputVector(319 downto 288) 		when (sel = "01001") else --9
					 inputVector(287 downto 256) 		when (sel = "01000") else
					 inputVector(255 downto 224) 		when (sel = "00111") else 
					 inputVector(223 downto 192) 		when (sel = "00110") else --6
					 inputVector(191 downto 160) 		when (sel = "00101") else --5
					 inputVector(159 downto 128) 		when (sel = "00100") else --4
					 inputVector(127 downto 96) 		when (sel = "00011") else --3
					 inputVector(95 downto 64) 		when (sel = "00010") else --2
					 inputVector(63 downto 32) 		when (sel = "00001") else --1
					 inputVector(31 downto 0) 			when (sel = "00000") else --0
					 "00000000000000000000000000000000";
					 
outputVector <= temp after 5 ns;

end Behavioral;

