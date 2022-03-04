library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

Entity Switchboard is

      port (A : in std_logic_vector(7 downto 0);
	    B : out std_logic_vector(7 downto 0);
            Q : out std_logic_vector(3 downto 0);
            S : in std_logic_vector(3 downto 0);
            T:  in time;
	    Arahat: in integer range 0 to 3);
    end Switchboard;

Architecture behv of Switchboard is
component mux8to4 is
    PORT( X: in std_logic_vector(7 downto 0);
          Y: out std_logic_vector(3 downto 0));
end  component;
component demux4to8 is
    PORT( X: in std_logic_vector(3 downto 0);
          Y: out std_logic_vector(7 downto 0));
end component;
    begin
    kaynak : mux8to4 port map(A,Q);
    hedef  : demux4to8 port map(S,B);

end behv;
