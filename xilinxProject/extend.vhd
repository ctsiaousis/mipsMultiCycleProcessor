--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:32:58 04/01/2019
-- Design Name:   
-- Module Name:   /home/autokratira/Scripts/kris/ORG/LAB4_impl/extend.vhd
-- Project Name:  LAB4_impl
-- Target Device:  
------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY extend IS
END extend;
 
ARCHITECTURE behavior OF extend IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT extender
    PORT(
         instr : IN  std_logic_vector(15 downto 0);
         ExtOp : IN  std_logic;
         o : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal instr : std_logic_vector(15 downto 0) := (others => '0');
   signal ExtOp : std_logic := '0';

 	--Outputs
   signal o : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: extender PORT MAP (
          instr => instr,
          ExtOp => ExtOp,
          o => o
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		instr <= "1000000000000000";
      wait for 100 ns;	
		ExtOp <= '1';
      -- insert stimulus here 

      wait;
   end process;

END;
