LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity mux8to4 is
    PORT(
          X: in std_logic_vector(7 downto 0);
          Y: out std_logic_vector(3 downto 0));
end mux8to4;


architecture logic of mux8to4 is
 begin
 Y<= "0000" when X(0)='1' else
     "0001" when X(1)='1' else
     "0010" when X(2)='1' else
     "0011" when X(3)='1' else
     "0100" when X(4)='1' else
     "0101" when X(5)='1' else
     "0110" when X(6)='1' else
     "0111" when X(7)='1';
end logic;