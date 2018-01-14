----------------------------------------------------------------------------------
-- Company: Cal Poly Pomona
-- Engineer: Trenton Condrin
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2x1 is
    port(S, I1, I0: in STD_LOGIC;
         Y: out STD_LOGIC);
end mux_2x1;

architecture Behavioral of mux_2x1 is

begin
with s select
    Y <= I0 when '0',
         I1 when '1',
         '0' when others;
end Behavioral;
