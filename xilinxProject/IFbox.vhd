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

entity IFbox is
    Port ( PC_Immed : in  STD_LOGIC_VECTOR (31 downto 0);
			  fromEPC : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_sel : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           fsmSEL : in  STD_LOGIC;
			  handlerSEL : in std_logic;								-----
			  handlerADDR: in std_logic_vector(31 downto 0); -----
			  branch : in std_logic;
           PC_out : out  STD_LOGIC_VECTOR (31 downto 0));
end IFbox;

architecture Behavioral of IFbox is

	component PC is
    Port ( Din : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_load : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
	end component; 
	
	component Mux2to1noCLK is
	generic(N : integer := 31);
    Port ( in0 : in  STD_LOGIC_vector(N downto 0);
           in1 : in  STD_LOGIC_vector(N downto 0);
			  sel : in STD_logic;
           output : out  STD_LOGIC_vector(N downto 0));
	end component;
	
	component ifBOXadder is
    Port ( pc_addr : in  STD_LOGIC_VECTOR (31 downto 0);
           immed : in  STD_LOGIC_VECTOR (31 downto 0);
           out_immed : out  STD_LOGIC_VECTOR (31 downto 0);
			  jumpAround : in std_logic;
           out_4 : out  STD_LOGIC_VECTOR (31 downto 0));
	end component; 


signal immedToMux, fourToMux, fromPC, toPC, tomux2, fromEPCmux : std_logic_vector(31 downto 0);

begin

epcMUX : Mux2to1noCLK
		port map(in0	=>fromPC,
					in1	=>fromEPC,
					sel	=>fsmSEL,
					output=>fromEPCmux);
regPC : PC
		port map(Din		=>toPC,
					PC_load	=>PC_LdEn,
					CLK		=>CLK,
					Reset		=>Reset,
					Dout		=>fromPC);
					
muxno2 : Mux2to1noCLK
		port map(in0	=> tomux2,
					in1	=> handlerADDR,
					sel	=> handlerSEL,
					output=> toPC);

mux : Mux2to1noCLK
		port map(in0	=> fourToMux,
					in1	=> immedToMux,
					sel	=> PC_sel,
					output=> tomux2);

adder : ifBOXadder
		port map(pc_addr 		=> fromEPCmux,
					immed 		=> PC_Immed,
					out_immed	=> immedToMux,
					jumpAround	=> branch,
					out_4			=> fourToMux);
					
PC_out <= fromPC;					

end Behavioral;

