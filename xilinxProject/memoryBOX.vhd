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

entity memoryBOX is
    Port ( clk : in  STD_LOGIC;
           Mem_WrEn : in  STD_LOGIC;
           exc : out  STD_LOGIC;
           ALU_MEM_Addr : in  STD_LOGIC_VECTOR (10 downto 0);
           ALU_MEM_EXC  : in  STD_LOGIC_VECTOR (10 downto 0);
           MEM_DataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataOut : out  STD_LOGIC_VECTOR (31 downto 0);
			  INST_Addr : in std_logic_vector(10 downto 0);
			  INST_DataOut : out STD_LOGIC_VECTOR (31 downto 0));
end memoryBOX;

architecture Behavioral of memoryBOX is

	component  memory is
    Port ( inst_addr : in  STD_LOGIC_VECTOR (10 downto 0);
           inst_dout : out  STD_LOGIC_VECTOR (31 downto 0);
           data_we : in  STD_LOGIC;
           data_addr : in  STD_LOGIC_VECTOR (10 downto 0);
           data_din : in  STD_LOGIC_VECTOR (31 downto 0);
           data_dout : out  STD_LOGIC_VECTOR (31 downto 0);
			  clk			: in std_logic);
	end component;
	
	component  add0x400 is
    Port ( I : in  STD_LOGIC_VECTOR (10 downto 0);
			  C : in std_logic_VECTOR (10 downto 0);
			  E : out std_logic;
           O : out  STD_LOGIC_VECTOR (10 downto 0));
	end component;
	
	
signal offset : std_logic_vector(10 downto 0);	
begin

mnim : memory
		port map(inst_addr => INST_Addr, ------------------
					inst_dout => INST_DataOut,
					data_we	 => MEM_WrEn,
					data_addr => offset,
					data_din	 => MEM_DataIn,
					data_dout => MEM_DataOut,
					clk	 	 => clk);

offsetER : add0x400
		port map(I	=> ALU_MEM_Addr,
					C	=> ALU_MEM_EXC,
					E	=> exc,
					O	=> offset);

end Behavioral;

