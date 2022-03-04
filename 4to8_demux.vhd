LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity demux4to8 is
    PORT( X: in std_logic_vector(3 downto 0);
          Y: out std_logic_vector(7 downto 0));
end demux4to8;


architecture logic of demux4to8 is
 begin
    Y(0)<='1' when X = "0000" else '0';
    Y(1)<='1' when X = "0001" else '0';
    Y(2)<='1' when X = "0010" else '0';
    Y(3)<='1' when X = "0011" else '0';
    Y(4)<='1' when X = "0100" else '0';
    Y(5)<='1' when X = "0101" else '0';
    Y(6)<='1' when X = "0110" else '0';
    Y(7)<='1' when X = "0111" else '0';
end logic;

