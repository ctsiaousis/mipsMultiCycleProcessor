------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY stageALUTEST IS
END stageALUTEST;
 
ARCHITECTURE behavior OF stageALUTEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALUbox
    PORT(
         RF_A : IN  std_logic_vector(31 downto 0);
         RF_B : IN  std_logic_vector(31 downto 0);
         Immed : IN  std_logic_vector(31 downto 0);
         ALU_Bin_Sel : IN  std_logic;
         ALU_Func : IN  std_logic_vector(3 downto 0);
         ALU_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RF_A : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_B : std_logic_vector(31 downto 0) := (others => '0');
   signal Immed : std_logic_vector(31 downto 0) := (others => '0');
   signal ALU_Bin_Sel : std_logic := '0';
   signal ALU_Func : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal ALU_out : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALUbox PORT MAP (
          RF_A => RF_A,
          RF_B => RF_B,
          Immed => Immed,
          ALU_Bin_Sel => ALU_Bin_Sel,
          ALU_Func => ALU_Func,
          ALU_out => ALU_out
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      RF_A <= "00000000000000001111111111111111";
		RF_B <= "11111111111111110000000000000000";
		Immed <= "00000000000000000000000000000000";
      wait for 300 ns;
		ALU_Bin_Sel <= '1';

      wait for 200 ns;
		ALU_Bin_Sel <= '0';
		wait for 200 ns;
		ALU_Func <= "0001";
      -- insert stimulus here 

      wait;
   end process;

END;
