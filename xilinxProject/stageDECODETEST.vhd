-------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY stageDECODETEST IS
END stageDECODETEST;
 
ARCHITECTURE behavior OF stageDECODETEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DECODEbox
    PORT(
         Instr : IN  std_logic_vector(31 downto 0);
         RF_WrEn : IN  std_logic;
         ALU_out : IN  std_logic_vector(31 downto 0);
         MEM_out : IN  std_logic_vector(31 downto 0);
         RF_WrData_sel : IN  std_logic;
         RF_B_sel : IN  std_logic;
         CLOCK : IN  std_logic;
         EXT_op : IN  std_logic;
         Immed : OUT  std_logic_vector(31 downto 0);
         RF_A : OUT  std_logic_vector(31 downto 0);
         RF_B : OUT  std_logic_vector(31 downto 0);
         RST : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Instr : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_WrEn : std_logic := '0';
   signal ALU_out : std_logic_vector(31 downto 0) := (others => '0');
   signal MEM_out : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_WrData_sel : std_logic := '0';
   signal RF_B_sel : std_logic := '0';
   signal CLOCK : std_logic := '0';
   signal EXT_op : std_logic := '0';
   signal RST : std_logic := '0';

 	--Outputs
   signal Immed : std_logic_vector(31 downto 0);
   signal RF_A : std_logic_vector(31 downto 0);
   signal RF_B : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLOCK_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DECODEbox PORT MAP (
          Instr => Instr,
          RF_WrEn => RF_WrEn,
          ALU_out => ALU_out,
          MEM_out => MEM_out,
          RF_WrData_sel => RF_WrData_sel,
          RF_B_sel => RF_B_sel,
          CLOCK => CLOCK,
          EXT_op => EXT_op,
          Immed => Immed,
          RF_A => RF_A,
          RF_B => RF_B,
          RST => RST
        );

   -- Clock process definitions
   CLOCK_process :process
   begin
		CLOCK <= '0';
		wait for CLOCK_period/2;
		CLOCK <= '1';
		wait for CLOCK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      RST <= '1';
      wait for 200 ns;	
		RST <= '0';
      wait for CLOCK_period*5;
		wait for 30 ns;
		Instr <= "00000001100011001000000000000111";
		wait for CLOCK_period*5;
		wait for 30 ns;
		ALU_out <= "11111111000000001111111100000000";
		RF_WrEn <= '1';
		wait for CLOCK_period*5;
		wait for 30 ns;
		RF_WrEn <= '0';
		EXT_op <= '1';
		wait for CLOCK_period*5;
		wait for 30 ns;
      EXT_op <= '0';
		wait for CLOCK_period*5;
		wait for 30 ns;

      wait;
   end process;

END;
