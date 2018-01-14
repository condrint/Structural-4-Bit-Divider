----------------------------------------------------------------------------------
-- Company: Cal Poly Pomona
-- Engineer: Trenton Condrin
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_subtractor is
    port(X, Y: in STD_LOGIC;
         Bin: in STD_LOGIC;
         DIFF, Bout: out STD_LOGIC);
end full_subtractor;

architecture Behavioral of full_subtractor is

begin
    DIFF<= Bin XOR (X XOR Y);
    Bout<= ((NOT (X XOR Y)) AND Bin) OR (NOT(X) AND Y);
end Behavioral;
