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

entity ALUbox is
    Port ( RF_A : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : in  STD_LOGIC_VECTOR (31 downto 0);
           Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_Bin_Sel : in  STD_LOGIC;
           ALU_Func : in  STD_LOGIC_VECTOR (3 downto 0);
			  Zero		:out std_logic;
           ALU_out : out  STD_LOGIC_VECTOR (31 downto 0));
end ALUbox;

architecture Behavioral of ALUbox is

	component ALU is
    Port ( inputA : in  STD_LOGIC_VECTOR (31 downto 0);
           inputB : in  STD_LOGIC_VECTOR (31 downto 0);
           OP : in  STD_LOGIC_VECTOR (3 downto 0);
           ZERO : out  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC;
           OUTPUT : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;

	
	component Mux2to1noCLK is
	generic(N : integer := 31);
    Port ( in0 : in  STD_LOGIC_vector(N downto 0);
           in1 : in  STD_LOGIC_vector(N downto 0);
			  sel : in STD_logic;
           output : out  STD_LOGIC_vector(N downto 0));
	end component;

signal fromMux: std_logic_vector(31 downto 0);
begin

ALahU : ALU
		port map(inputA	=> RF_A,
					inputB	=> fromMux,
					OP			=> ALU_Func,
					Zero		=> Zero,
					Cout		=> open,
					Ovf		=> open,
					OUTPUT	=> ALU_out);
					
multipleX : Mux2to1noCLK
		port map(in0	=> RF_B,
					in1	=> Immed,
					sel	=> ALU_Bin_Sel,
					output=> fromMux);

end Behavioral;

