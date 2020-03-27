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

entity exceptionHANDLER is
    Port ( CLK : in  STD_LOGIC;
			  RST : in  STD_LOGIC;
			  FSMsel : in  STD_LOGIC;
			  EPC_EN : in  STD_LOGIC;
			  EPC : in std_logic_vector(31 downto 0);
			  CAU : in std_logic_vector(31 downto 0);
			  handlerADDR : in std_logic_vector(31 downto 0);
			  Eout : out std_logic_vector(31 downto 0);
			  toMEM : out std_logic_vector(31 downto 0);
			  Cout : out std_logic_vector(31 downto 0)
			  );
end exceptionHANDLER;

architecture Behavioral of exceptionHANDLER is

	component Mux2to1noCLK is
	generic(N : integer := 31);
    Port ( in0 : in  STD_LOGIC_vector(N downto 0);
           in1 : in  STD_LOGIC_vector(N downto 0);
			  sel : in STD_logic;
           output : out  STD_LOGIC_vector(N downto 0));
	end component;

	component genericREG is
	generic(N : integer := 31);
    Port ( Data : in  STD_LOGIC_VECTOR (N downto 0);
           writeEnable : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (N downto 0);
			  Reset : in std_logic);
	end component;

begin

muxToMEM : Mux2to1noCLK
		port map(in0	=>EPC,
					in1	=>handlerADDR,
					sel	=>FSMsel,
					output=>toMEM);

EPCregister : genericREG
		port map(Data			=> EPC,
					writeEnable	=> EPC_EN,
					CLK			=> CLK,
					Dout			=> Eout,
					Reset			=> RST);
					
CauseRegister : genericREG
		port map(Data			=> CAU,
					writeEnable	=> EPC_EN,
					CLK			=> CLK,
					Dout			=> Cout,
					Reset			=> RST);


end Behavioral;

