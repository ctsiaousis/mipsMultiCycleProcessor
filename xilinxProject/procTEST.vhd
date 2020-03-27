------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY procTEST IS
END procTEST;
 
ARCHITECTURE behavior OF procTEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PROCESSOR
    PORT(
         Reset : IN  std_logic;
         Clock : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Reset : std_logic := '0';
   signal Clock : std_logic := '0';

   -- Clock period definitions
   constant Clock_period : time := 40 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PROCESSOR PORT MAP (
          Reset => Reset,
          Clock => Clock
        );

   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      Reset <= '1';
      wait for 100 ns;	
		Reset <= '0';
      wait for Clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
