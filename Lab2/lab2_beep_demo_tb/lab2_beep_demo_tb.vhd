-- project: lab2 - beep demo
-- file: lab2_beep_demo_tb.vhd
-- description:
--    testbench for functional verification of entire project

library IEEE;
use IEEE.std_logic_1164.all;

-- uncomment the following library declaration if using
-- arithmetic functions with signed or unsigned values
--use ieee.numeric_std.all;

entity lab2_beep_demo_tb is
end entity;

architecture lab2_beep_demo_tb_arch of lab2_beep_demo_tb is 

	-- component declaration for the unit under test (uut)

	component lab2_beep_demo
		generic (
		BOARD_CLK_FREQ : natural; -- CLK frequency in Hz
		SND_MODE: std_logic       -- output generation mode: '0' = constant, '1' = waveform
	);
	port (
		CLK : in  STD_LOGIC;
		RST : in  STD_LOGIC;
		SWI : in  STD_LOGIC_VECTOR (3 downto 0);
		LED : out  STD_LOGIC_VECTOR (3 downto 0);
		BPO : out STD_LOGIC
	);
	end component;


	--inputs
	signal clk : std_logic := '0';
	signal rst : std_logic := '0';
	signal swi : std_logic_vector(3 downto 0) := (others => '1');

	--outputs
	signal led : std_logic_vector(3 downto 0);
	signal bpo : std_logic;

	-- clock period definitions
	constant clk_period : time := 20 ns;
	constant fake_freq : natural := 5000;
	constant active_generator : std_logic := '0';  -- active buzzer - constant value
	constant passive_generator : std_logic := '1'; -- passive buzzer - waveform
	
begin

	-- instantiate the unit under test (uut)
	uut: lab2_beep_demo 
		generic map (
		    BOARD_CLK_FREQ => fake_freq,
		    SND_MODE => passive_generator
		)
		port map (
			CLK => clk,
			RST => rst,
			SWI => swi,
			LED => led,
			BPO => bpo
		);

	-- clock process definitions
	clk_process :process
	begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
	end process;
 

	-- stimulus process
	stim_proc: process
	begin
		rst <= '0';
		-- hold reset state for 100 ns
		wait for 100 ns;
		rst <= '1';
		wait for clk_period*10;
		
		-- imitate fast switch on KEY0 - turn LED0 on
		swi <= "1110";
		wait for 10 us;
		swi <= "1111";
		wait for 300 us;

		-- imitate fast switch on KEY0 - turn LED0 slow blink
		swi <= "1110";
		wait for 10 us;
		swi <= "1111";
		wait for 300 us;

		-- imitate fast switch on KEY0 - turn LED0 off
		swi <= "1110";
		wait for 10 us;
		swi <= "1111";
		wait for 300 us;

		-- imitate long switch on KEY0 - turn LED0 fast blink
		swi <= "1110";
		wait for 150 us;
		swi <= "1111";
		wait for 300 us;

		-- imitate fast switch on KEY0 - turn LED0 off
		swi <= "1110";
		wait for 10 us;
		swi <= "1111";
		wait for 300 us;

		wait;
	end process;

end architecture;
