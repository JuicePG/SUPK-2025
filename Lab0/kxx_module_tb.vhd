-- project: lab0 - demo and introduction
-- file: kx_module_testbench.vhd
-- description:
--    functional verivication of module kx_module
--    main purpose is to get familiar with running testbenches
--    and perform functional verification

library IEEE;
use IEEE.std_logic_1164.all;

entity kxx_module_tb is
end entity;

architecture kxx_module_tb_arch of kxx_module_tb is

	-- component declaration for the Unit Under Test (UUT)
	component kxx_module
		port (
			x : in std_logic_vector(3 downto 0);
			y : out std_logic_vector(3 downto 0)
		);
	end component;

	--input signals
	signal t_x : std_logic_vector(3 downto 0) := (others => '0');

	--output signals
	signal t_y : std_logic_vector(3 downto 0);

begin

	-- instantiate the Unit Under Test (UUT)
	uut: kxx_module
		port map (
			x => t_x,
 			y => t_y
		);

	-- stimulus process
	stim_proc: process
	begin
		t_x <= "0000";
		wait for 10 ns;
		assert (t_y = "1101") report "Output error for x=0000!" severity ERROR; 
		t_x <= "0001";					   
		wait for 10 ns;
		assert (t_y = "0010") report "Output error for x=0001!" severity ERROR;	
		t_x <= "0010";
		wait for 10 ns;														   
		assert (t_y = "1000") report "Output error for x=0010!" severity ERROR; 
		t_x <= "0011";
		wait for 10 ns;														   
		assert (t_y = "0100") report "Output error for x=0011!" severity ERROR; 
		t_x <= "0100";
		wait for 10 ns;														   
		assert (t_y = "0110") report "Output error for x=0100!" severity ERROR;	
		t_x <= "0101";
		wait for 10 ns;														   
		assert (t_y = "1111") report "Output error for x=0101!" severity ERROR;
		t_x <= "0110";
		wait for 10 ns;														   
		assert (t_y = "1011") report "Output error for x=0110!" severity ERROR;
		t_x <= "0111";
		wait for 10 ns;														   
		assert (t_y = "0001") report "Output error for x=0111!" severity ERROR;
		t_x <= "1000";
		wait for 10 ns;														   
		assert (t_y = "1010") report "Output error for x=1000!" severity ERROR;
		t_x <= "1001";
		wait for 10 ns;														   
		assert (t_y = "1001") report "Output error for x=1001!" severity ERROR;
		t_x <= "1010";
		wait for 10 ns;														   
		assert (t_y = "0011") report "Output error for x=1010!" severity ERROR;
		t_x <= "1011";
		wait for 10 ns;														   
		assert (t_y = "1110") report "Output error for x=1011!" severity ERROR;
		t_x <= "1100";
		wait for 10 ns;														   
		assert (t_y = "0101") report "Output error for x=1100!" severity ERROR;
		t_x <= "1101";
		wait for 10 ns;														   
		assert (t_y = "0000") report "Output error for x=1101!" severity ERROR;
		t_x <= "1110";
		wait for 10 ns;														   
		assert (t_y = "1100") report "Output error for x=1110!" severity ERROR;
		t_x <= "1111";
		wait for 10 ns;														   
		assert (t_y = "0111") report "Output error for x=1111!" severity ERROR;
		report "All simulators are verified. Simulation is over." severity NOTE;
		wait;
	end process;

end architecture;
