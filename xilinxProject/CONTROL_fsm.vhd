--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CONTROL_fsm is
    Port ( RST : in  STD_LOGIC;
           INST : in  STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC;
			  zero : in STD_LOGIC;
			  exc : in STD_LOGIC;
			  ALU_B_SEL : out  STD_LOGIC;
			  EPC_SEL : out  STD_LOGIC; ---
			  CAUSE_SEL : out  STD_LOGIC; ---
           EPC_EN : out  STD_LOGIC; ----
           MV_SEL : out  STD_LOGIC; ----
           RF_WrData_S : out  STD_LOGIC;
			  RF_Wr_EN : out  STD_LOGIC;
           RF_B_S : out  STD_LOGIC;
           Extend_OP : out  STD_LOGIC;
			  byte_op : out std_logic;
           PC_SEL : out  STD_LOGIC;
           PC_En : out  STD_LOGIC;
			  Branch_S : out std_logic;
			  CAUSE_VALUE : out std_logic_vector(31 downto 0); --
			  HANDLE_ADDR : out std_logic_vector(31 downto 0); --
			  ALU_FUNC : out std_logic_vector(3 downto 0);
           MEM_WrEN : out  STD_LOGIC);
end CONTROL_fsm;

architecture stages of CONTROL_fsm is

type state is (resetST,instructionST,nothing,regALU,regALU2,regALU3,immALU,immALU2,immALU3,EndST,Store,Store1,Store2,Store3,Load,Load1,
Load2,Load3,Jump,Branch,BranchBNE,BranchBNE1,BranchBEQ,Exception,jmpEXC,mvEXC,memEXC);
--,Exception
signal current_state, next_state: state;

begin
	
	stages :process(current_state,INST,zero,exc)
	begin
		case current_state is
			when resetST 		=>	---------------------------------------------reset all signals
			   EPC_SEL 			<= '0'; ---
			   CAUSE_SEL 		<= '0'; ---
            EPC_EN 			<= '0'; ----
            MV_SEL			<= '0';----
			   CAUSE_VALUE 	<= (others => '0'); --
			   HANDLE_ADDR 	<= (others => '0'); --
				ALU_B_SEL		<= '0';
				RF_WrData_S		<= '0';
				RF_Wr_EN			<= '0';
				RF_B_S			<= '0';
				Extend_OP		<= '0';
				byte_op			<= '0';
				PC_SEL			<= '0';
				PC_En				<= '0';
				Branch_S			<= '0';
				ALU_FUNC			<= "0000";
				MEM_WrEN			<= '0';
				next_state		<= instructionST;
			when instructionST=> -------------------------------------------decode instructions
				if(INST="00000000000000000000000000000000") then --nothing
					next_state	<= nothing;
					elsif(INST(31 downto 26)="100000") then --ALU
						next_state	<=	regALU;
					elsif(INST(31 downto 26)="111000") then --li
						--next_state	<=	Load;
					elsif(INST(31 downto 26)="111001") then --lui
						--next_state	<= Load;
					elsif(INST(31 downto 26)="110000") then	--addi
						next_state	<= immALU;
					elsif(INST(31 downto 26)="110010") then --nandi
						next_state	<= immALU;
					elsif(INST(31 downto 26)="110011") then --ori
						next_state	<= immALU;
					elsif(INST(31 downto 26)="111111") then --b
						next_state	<=	Jump;
					elsif(INST(31 downto 26)="000000") then --beq
						next_state	<= Branch;
					elsif(INST(31 downto 26)="000001") then --bne
						next_state	<= Branch;
					elsif(INST(31 downto 26)="000011") then --lb
						next_state	<=	Load;
					elsif(INST(31 downto 26)="000111") then --sb
						next_state	<= Store;
					elsif(INST(31 downto 26)="001111") then --lw
						next_state	<= Load;
					elsif(INST(31 downto 26)="011111") then --sw
						next_state	<= Store;
					elsif(INST(31 downto 26)="000010") then --jump_epc
						next_state	<= jmpEXC;
					elsif(INST(31 downto 26)="001000") then --move_cause
						next_state	<= mvEXC;
					else next_state	<= Exception;
				end if;
------------------------------------------MEMORY EXCEPTION---------------------------------------
				when memEXC	=>
						EPC_SEL 			<= '0'; ---
						CAUSE_SEL 		<= '1'; ---
						EPC_EN 			<= '1'; ----
						PC_En				<= '1';
						CAUSE_VALUE 	<= "00000000000100010001000000000000"; --
						HANDLE_ADDR 	<= "00000000000000000000000100000000";
						next_state		<= EndST;
				
----------------------------------------MOVE CAUSE EXCEPTION-------------------------------------
				when mvEXC	=>
					MV_SEL 	<= '1';
					RF_Wr_EN	<= '1';
					ALU_B_SEL		<= '0'; --rf_B
					RF_WrData_S		<= '0'; --ALU_out
					RF_Wr_EN			<= '1';
					--CAUSE_SEL		<= '1';
					PC_En			<= '1';
					next_state		<= EndST;				
				
-------------------------------------------JUMP EXCEPTION----------------------------------------
			when jmpEXC	=>
				EPC_SEL		<= '1';
				PC_En			<= '1';
				next_state	<= EndST;
----------------------------------------------Exception------------------------------------------
			when Exception	=>
				EPC_SEL 			<= '0'; ---
			   CAUSE_SEL 		<= '1'; ---
            EPC_EN 			<= '1'; ----
				PC_En				<= '1';
			   CAUSE_VALUE 	<= "00000000000000000000000100010001"; --
			   HANDLE_ADDR 	<= "00000000000000000000000011000000";
				next_state		<= EndST;

				
---------------------------------------------ALU no immed----------------------------------------
			when regALU		=> 
				if INST(5 downto 0)="110000" then	--add
					ALU_func<= "0000";			
					elsif INST(5 downto 0)="110001" then --sub
						ALU_func<= "0001";		
					elsif INST(5 downto 0)="110010" then --nand
						ALU_func<= "0010";
					elsif INST(5 downto 0)="110011" then --or
						ALU_func<= "0011";
					elsif INST(5 downto 0)="110100" then --not
						ALU_func<= "0100";
					elsif INST(5 downto 0)="111000" then --sra
						ALU_func<= "1000";
					elsif INST(5 downto 0)="111001" then --sll
						ALU_func<= "1010";
					elsif INST(5 downto 0)="111010" then --srl
						ALU_func<= "1001";
					elsif INST(5 downto 0)="111100" then --rol
						ALU_func<= "1100";
					elsif INST(5 downto 0)="111101" then --ror
						ALU_func<= "1101";
				end if;
				next_state		<= regALU2;
				-----------------------------ALU no IMMED2---------------------------- 
			when regALU2	=>
				ALU_B_SEL		<= '0'; --rf_B
				RF_WrData_S		<= '0'; --ALU_out
				RF_Wr_EN			<= '1'; 
				RF_B_S			<= '0';
				Extend_OP		<= '0';
				byte_op			<= '0';
				PC_SEL			<= '0';
				PC_En				<= '0';
				Branch_S			<= '0';
				MEM_WrEN			<= '0';
				
				next_state		<= regALU3;
			when regALU3	=>
				PC_EN				<= '1';
				next_state		<= EndST;
----------------------------------------------ALU with immed----------------------------------------
			when immALU		=> 
				if (INST(31 downto 26)="110010") then --nandi
					Extend_OP		<= '0';
					ALU_func			<= "0010";
					elsif(INST(31 downto 26)="110000") then	--addi
						Extend_OP	<= '1';
						ALU_func		<= "0000";
					elsif (INST(31 downto 26)="110011") then --ori
						Extend_OP	<= '0';
						ALU_func		<= "0011";
				end if;
				next_state		<= immALU2;
				---------------------------------ALU with immed2-------------------------------
			when immALU2	=>
				ALU_B_SEL		<= '1'; --Immed
				RF_WrData_S		<= '0'; --ALU_out
				RF_Wr_EN			<= '1'; 
				RF_B_S			<= '0';
				byte_op			<= '0';
				PC_SEL			<= '0';
				PC_En				<= '0';
				Branch_S			<= '0';
				MEM_WrEN			<= '0';
				
				next_state		<= immALU3;
			when immALU3	=>
				PC_En				<= '1';
				next_state		<= EndST;
			
---------------------------------------------STORE--------------------------------------------------			
			when Store	=>
				RF_B_S			<= '1'; 
				next_state		<= Store1;
				-------------------------------alu SIGNALS--------------------------------------
			when Store1	=>
				ALU_FUNC			<= "0000";
				ALU_B_SEL		<= '1'; --Immed
				next_state		<= Store2;
				---------------------------------Word or Byte-----------------------------------
			when Store2	=>
				if (INST(31 downto 26)="011111") then 	--sw
					byte_op		<= '0';
				else											  	--sb
					byte_op		<= '1';
				end if;
				Extend_op		<= '1';
				MEM_WrEn			<= '1';
				if(exc = '1') then --mem out of reach
						next_state	<=	memEXC;
					else
				next_state	<= Store3;
				end if;
				
			when Store3	=>
				RF_Wr_EN	<='0';
				MEM_WrEn <= '0';
				PC_En	<= '1';
				next_state	<= endST;
			
-----------------------------------------------Load-----------------------------------------
			when Load	=>
				ALU_B_Sel <= '1';
				ALU_FUNC		<= "0000";
				next_state	<= Load1;
				
			when Load1	=>
				if (INST(31 downto 26)="001111") then --lw
						byte_op	<= '0';
					else											--lb
						byte_op	<= '1';
				end if;
				next_state	<= Load2;
				
			when Load2	=>
				RF_WR_EN 	<='1';
				RF_WrData_S	<='1'; --Mem out 
				RF_B_S  		<='0';
				Extend_OP	<='1';
				ALU_B_SEL 	<='1';  --Immed
				ALU_FUNC 	<="0000"; --add		
				Mem_WrEn  	<='0'; 
				if(exc = '1') then --mem out of reach
						next_state	<=	memEXC;
					else
				next_state	<= Load3;
				end if;
				
			when Load3	=>
				RF_Wr_EN	<='0';
				MEM_WrEn <='0';
				PC_En		<='1';
				PC_SEL	<='0';
				next_state	<= EndST;
----------------------------------------JUMP-----------------------------------------------------
			when Jump	=>
				PC_sel 		<='1'; 			
				PC_En 		<='1'; 
				RF_Wr_EN 	<='0';
				RF_WrData_S <='0'; --Mem out 
				RF_B_S  		<='0';
				Extend_OP	<='1'; 
				ALU_B_SEL	<='0';  --Immed
				ALU_FUNC 	<="0000"; --add			
				MEM_WrEn  	<='0';
				Branch_S		<='1';
				next_state	<=EndST;
-----------------------------------------------BRANCH----------------------------------------------
			when Branch	=>
				if(INST(31 downto 26)="000001") then
					next_state	<=	BranchBNE;
				else
					next_state	<= BranchBEQ;
				end if;
				-------------------------------------BNE--------------------------------
			when BranchBNE		=>
				RF_Wr_EN		<='0';
				RF_WrData_S <='0'; --Alu out 
				RF_B_S  		<='0';
				Extend_OP	<='1';
				byte_op		<='0';
				ALU_B_SEL 	<='1';  --Immed
				ALU_FUNC 	<="0001"; --sub			
				MEM_WrEN		<='0';
				Branch_S		<='1';
				next_state 	<=BranchBNE1;
				
			when BranchBNE1	=>
					if (zero = '0') then
						next_state	<= Jump;
					else
						next_state	<= EndST;
					end if;
			---------------------------------------BEQ---------------------------------
			when BranchBEQ	=>
				RF_Wr_EN		<='0';
				RF_WrData_S <='0'; --Alu out 
				RF_B_S  		<='0';
				Extend_OP	<='1';
				byte_op		<='0';
				ALU_B_SEL	<='1';  --Immed
				ALU_FUNC 	<="0001"; --sub			
				MEM_WrEN		<='0';
				Branch_S		<='1';
					if (zero = '0') then
						next_state	<= EndST;
					else
						next_state	<= Jump;
					end if;
--------------------------------------------------------------------------------------------			
			when EndST	=>
				EPC_SEL 			<= '0'; ---
			   CAUSE_SEL 		<= '0'; ---
            EPC_EN 			<= '0'; ----
            MV_SEL			<= '0';----
			   CAUSE_VALUE 	<= (others => '0'); --
			   HANDLE_ADDR 	<= (others => '0'); --
				ALU_B_SEL		<= '0';
				RF_WrData_S		<= '0';
				RF_Wr_EN			<= '0';
				RF_B_S			<= '0';
				Extend_OP		<= '0';
				byte_op			<= '0';
				PC_SEL			<= '0';
				PC_En				<= '0';
				Branch_S			<= '0';
				ALU_FUNC			<= "0000";
				MEM_WrEN			<= '0';
				if(exc = '1') then --mem out of reach
						next_state	<=	memEXC;
					else
				next_state	<= instructionST;
				end if;
					
			when others => next_state <= instructionST;
		end case;
	end process;
	
	
	
	
	roll : process(CLK,RST)
	begin
		if (rising_edge(CLK)) then
			if RST = '1' then
				current_state <= resetST;
				else		current_state <= next_state;
			end if;
		end if;
	end process;
	
end stages;
