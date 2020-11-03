library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sumresdef is
	port(
	a : in std_logic_vector(4 downto 0);
	b : in std_logic_vector(4 downto 0);
	sr : in std_logic;
	ov : out std_logic;
	d_0 : out std_logic_vector(6 downto 0);
	d_1 : out std_logic_vector(6 downto 0));
end sumresdef;

architecture structural of sumresdef is
	signal r : std_logic_vector(4 downto 0);
	
	component sumres
		port( 
		a: in std_logic_vector(4 downto 0);
		b: in std_logic_vector(4 downto 0);
		sr : in std_logic;
		c_out: out std_logic;
		s : out std_logic_vector(4 downto 0);
		ov : out std_logic);
	end component;
	
	component BinA7Seg
	port(
		E			:in std_logic_vector(3 downto 0);
		salida	:out std_logic_vector(6 downto 0));
	end component;
	
	begin
		
		i_sumres : sumres
			port map(
			s=> r,
			a=>a,
			b=>b,
			ov=>ov,
			sr=>sr);
		
		BinA7Seg_display0: BinA7Seg
			port map(
			E=>r(3 downto 0),
			salida=>d_0);
		BinA7Seg_display1: BinA7Seg
			port map(
			E=>"000" & r(4 downto 4),
			salida=>d_1);
end structural;