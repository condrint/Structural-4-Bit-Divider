----------------------------------------------------------------------------------
-- Company: Cal Poly Pomona
-- Engineer: Trenton Condrin
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity div4_test is
end div4_test;

architecture Behavioral of div4_test is
component divider_4
    Port(A, B: in std_logic_vector (3 downto 0);
         Q, R: out std_logic_vector (3 downto 0));
end component;

signal At: std_logic_vector(3 downto 0) := (others => '0');
signal Bt: std_logic_vector(3 downto 0) := (others => '0');

signal Qt: std_logic_vector(3 downto 0);
signal Rt: std_logic_vector(3 downto 0);

begin

uut: divider_4 
    Port Map (A=>At, B=>Bt, Q=>Qt, R=>Rt);
    
tb: process
begin
   At <= "1100"; Bt <= "0011"; wait for 5ns;
   At <= "1010"; Bt <= "1010"; wait for 5ns;
   At <= "0100"; Bt <= "1100"; wait for 5ns;
   At <= "1111"; Bt <= "0110"; wait for 5ns;
   wait;
end process;
     
end Behavioral;
