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

entity arithBOX is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
			  operation : in STD_LOGIC; --lsb tou OP
           output : out  STD_LOGIC_VECTOR (31 downto 0);
           cout : out  STD_LOGIC;
           overflow : out  STD_LOGIC);
end arithBOX;

architecture Behavioral of arithBOX is

signal localSum, localA, localB : unsigned(32 downto 0);
signal sumout : std_logic_vector(32 downto 0);
signal localFlow : std_logic;
begin
		localA <= resize(unsigned(A), 33);
		localB <= resize(unsigned(B), 33);
		localSum <= localA + localB when operation = '0' else
						localA - localB;
		
		sumout <= std_logic_vector(localsum);
		localFlow <= ((A(31) xor B(31)) and (sumout(31) and B(31))) when operation = '1' 
					else (((not A(31)) xor B(31)) and (sumout(31) and A(31))); --(operation and (not sumout(32))) or 
		output <= sumout(31 downto 0); --sumout(32) & sumout(30 downto 0);
		cout 	 <= sumout(32) after 10 ns;
		overflow <= localFlow after 10 ns;

end Behavioral;

