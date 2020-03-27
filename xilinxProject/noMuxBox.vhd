
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity noMuxBox is
    Port ( writeAD : in  STD_LOGIC_VECTOR (4 downto 0);
           CK : in  STD_LOGIC;
           wrEN : in  STD_LOGIC;
           dataIN : in  STD_LOGIC_VECTOR (31 downto 0);
           dataOUT : out  STD_LOGIC_VECTOR (1023 downto 0);
			  RST : in std_logic);
end noMuxBox;

architecture Behavioral of noMuxBox is

	component decoder5to32 is
    Port ( writeAddr : in  STD_LOGIC_VECTOR (4 downto 0);
           outAddr 	: out  STD_LOGIC_VECTOR (31 downto 0));
	end component;

	component register32BIT is
    Port ( Data : in  STD_LOGIC_VECTOR (31 downto 0);
           writeEnable : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reset : in std_logic);
	end component;
	
signal fromDec : std_logic_vector(31 downto 0);
signal en31, en30, en29, en28, en27, en26, en25, en24, en23, en22, en21, en20, en19, en18, en17, en16 : std_logic;
signal en15, en14, en13, en12, en11, en10, en9 , en8 , en7 , en6 , en5 , en4 , en3 , en2 , en1 , en0  : std_logic;

begin

DEC : decoder5to32
		port map(writeAddr=>writeAD,
					outAddr => fromDec);
	
		en31 <= wrEN and fromDec(31) after 2 ns;
reg31 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en31,
					CLK => CK,
					Dout => dataOUT(1023 downto 992),
					Reset => RST);
					
					
		en30 <= wrEN and fromDec(30) after 2 ns;
reg30 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en30,
					CLK => CK,
					Dout => dataOUT(991 downto 960),
					Reset => RST);
					
					
		en29 <= wrEN and fromDec(29) after 2 ns;
reg29 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en29,
					CLK => CK,
					Dout => dataOUT(959 downto 928),
					Reset => RST);
					
					
		en28 <= wrEN and fromDec(28) after 2 ns;
reg28 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en28,
					CLK => CK,
					Dout => dataOUT(927 downto 896),
					Reset => RST);
					
					
		en27 <= wrEN and fromDec(27) after 2 ns;
reg27 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en27,
					CLK => CK,
					Dout => dataOUT(895 downto 864),
					Reset => RST);
					
					
		en26 <= wrEN and fromDec(26) after 2 ns;
reg26 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en26,
					CLK => CK,
					Dout => dataOUT(863 downto 832),
					Reset => RST);
					
					
		en25 <= wrEN and fromDec(25) after 2 ns;
reg25 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en25,
					CLK => CK,
					Dout => dataOUT(831 downto 800),
					Reset => RST);
					
					
		en24 <= wrEN and fromDec(24) after 2 ns;
reg24 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en24,
					CLK => CK,
					Dout => dataOUT(799 downto 768),
					Reset => RST);
					
					
		en23 <= wrEN and fromDec(23) after 2 ns;
reg23 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en23,
					CLK => CK,
					Dout => dataOUT(767 downto 736),
					Reset => RST);
					
					
		en22 <= wrEN and fromDec(22) after 2 ns;
reg22 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en22,
					CLK => CK,
					Dout => dataOUT(735 downto 704),
					Reset => RST);
					
					
		en21 <= wrEN and fromDec(21) after 2 ns;
reg21 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en21,
					CLK => CK,
					Dout => dataOUT(703 downto 672),
					Reset => RST);
 					
					
		en20 <= wrEN and fromDec(20) after 2 ns;
reg20 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en20,
					CLK => CK,
					Dout => dataOUT(671 downto 640),
					Reset => RST);
 					
					
		en19 <= wrEN and fromDec(19) after 2 ns;
reg19 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en19,
					CLK => CK,
					Dout => dataOUT(639 downto 608),
					Reset => RST);
  					
					
		en18 <= wrEN and fromDec(18) after 2 ns;
reg18 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en18,
					CLK => CK,
					Dout => dataOUT(607 downto 576),
					Reset => RST);
  					
					
		en17 <= wrEN and fromDec(17) after 2 ns;
reg17 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en17,
					CLK => CK,
					Dout => dataOUT(575 downto 544),
					Reset => RST);
  					
					
		en16 <= wrEN and fromDec(16) after 2 ns;
reg16 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en16,
					CLK => CK,
					Dout => dataOUT(543 downto 512),
					Reset => RST);
   					
					
		en15 <= wrEN and fromDec(15) after 2 ns;
reg15 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en15,
					CLK => CK,
					Dout => dataOUT(511 downto 480),
					Reset => RST);
   					
					
		en14 <= wrEN and fromDec(14) after 2 ns;
reg14 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en14,
					CLK => CK,
					Dout => dataOUT(479 downto 448),
					Reset => RST);
 
   					
					
		en13 <= wrEN and fromDec(13) after 2 ns;
reg13 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en13,
					CLK => CK,
					Dout => dataOUT(447 downto 416),
					Reset => RST);
   					
					
		en12 <= wrEN and fromDec(12) after 2 ns;
reg12 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en12,
					CLK => CK,
					Dout => dataOUT(415 downto 384),
					Reset => RST);
   					
					
		en11 <= wrEN and fromDec(11) after 2 ns;
reg11 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en11,
					CLK => CK,
					Dout => dataOUT(383 downto 352),
					Reset => RST);
   					
					
		en10 <= wrEN and fromDec(10) after 2 ns;
reg10 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en10,
					CLK => CK,
					Dout => dataOUT(351 downto 320),
					Reset => RST);
   					
					
		en9 <= wrEN and fromDec(9) after 2 ns;
reg09 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en9,
					CLK => CK,
					Dout => dataOUT(319 downto 288),
					Reset => RST);
    					
					
		en8 <= wrEN and fromDec(8) after 2 ns;
reg08 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en8,
					CLK => CK,
					Dout => dataOUT(287 downto 256),
					Reset => RST);
    					
					
		en7 <= wrEN and fromDec(7) after 2 ns;
reg07 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en7,
					CLK => CK,
					Dout => dataOUT(255 downto 224),
					Reset => RST);
    					
					
		en6 <= wrEN and fromDec(6) after 2 ns;
reg06 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en6,
					CLK => CK,
					Dout => dataOUT(223 downto 192),
					Reset => RST);
    					
					
		en5 <= wrEN and fromDec(5) after 2 ns;
reg05 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en5,
					CLK => CK,
					Dout => dataOUT(191 downto 160),
					Reset => RST);
    					
					
		en4 <= wrEN and fromDec(4) after 2 ns;
reg04 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en4,
					CLK => CK,
					Dout => dataOUT(159 downto 128),
					Reset => RST);
    					
					
		en3 <= wrEN and fromDec(3) after 2 ns;
reg03 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en3,
					CLK => CK,
					Dout => dataOUT(127 downto 96),
					Reset => RST);
    					
					
		en2 <= wrEN and fromDec(2) after 2 ns;
reg02 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en2,
					CLK => CK,
					Dout => dataOUT(95 downto 64),
					Reset => RST);
    					
					
		en1 <= wrEN and fromDec(1) after 2 ns;
reg01 : register32BIT
		port map(Data=>dataIN,
					writeEnable => en1,
					CLK => CK,
					Dout => dataOUT(63 downto 32),
					Reset => RST);
    					
					
		en0 <= wrEN and fromDec(0) after 2 ns;
reg00 : register32BIT
		port map(Data=>x"00000000",
					writeEnable => en0,
					CLK => CK,
					Dout => dataOUT(31 downto 0),
					Reset => RST);
 
end Behavioral;

