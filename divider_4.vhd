----------------------------------------------------------------------------------
-- Company: Cal Poly Pomona
-- Engineer: Trenton Condrin
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divider_4 is
    port(A, B: in STD_LOGIC_VECTOR (3 downto 0);
         Q, R: out STD_LOGIC_VECTOR (3 downto 0)); 
end divider_4;

architecture Behavioral of divider_4 is

signal C: std_logic_vector(11 downto 0); --FS Bin/Bout connections
signal D: std_logic_vector(3 downto 0); --FS last bouts to Q
signal E: std_logic_vector(21 downto 0); --FS/Mux outputs
signal F: std_logic_vector(2 downto 0); --dont care FS outputs
signal G: std_logic_vector(3 downto 0); --layer 8 out

component full_subtractor is
    Port(X, Y, Bin: in std_logic; DIFF, Bout: out std_logic);
end component;

component mux_2x1 is
    Port(S, I1, I0: in std_logic; Y: out std_logic);
end component; 
begin
--layer 1 -- X, Y, Bin, DIFF, Bout
FS00:full_subtractor Port map(A(3), B(0), '0', E(0), C(0));
FS01:full_subtractor Port map('0', B(1), C(0), E(1), C(1));
FS02:full_subtractor Port map('0', B(2), C(1), E(2), C(2));
FS03:full_subtractor Port map('0', B(3), C(2),F(0), D(0));

--layer 2 -- S, I1, I0, Y
MUX00:mux_2x1 Port map(D(0), A(3), E(0), E(3));
MUX01:mux_2x1 Port map(D(0), '0', E(1), E(4));
MUX02:mux_2x1 Port map(D(0), '0', E(2), E(5));

--layer 3 -- X, Y, Bin, DIFF, Bout
FS04:full_subtractor Port map(A(2), B(0), '0', E(6), C(3));
FS05:full_subtractor Port map(E(3), B(1), C(3), E(7), C(4));
FS06:full_subtractor Port map(E(4), B(2), C(4), E(8), C(5));
FS07:full_subtractor Port map(E(5), B(3), C(5), F(1), D(1));

--layer 4 -- S, I1, I0, Y
MUX03:mux_2x1 Port map(D(1), A(2), E(6), E(9));
MUX04:mux_2x1 Port map(D(1), E(3), E(7), E(10));
MUX05:mux_2x1 Port map(D(1), E(4), E(8), E(11));

--layer 5 -- X, Y, Bin, DIFF, Bout
FS08:full_subtractor Port map(A(1), B(0), '0', E(12), C(6));
FS09:full_subtractor Port map(E(9), B(1), C(6), E(13), C(7));
FS10:full_subtractor Port map(E(10), B(2), C(7), E(14), C(8));
FS11:full_subtractor Port map(E(11), B(3), C(8), F(2), D(2));

--layer 6 -- S, I1, I0, Y
MUX06:mux_2x1 Port map(D(2), A(1), E(12), E(15));
MUX07:mux_2x1 Port map(D(2), E(9), E(13), E(16));
MUX08:mux_2x1 Port map(D(2), E(10), E(14), E(17));

--layer 7 -- X, Y, Bin, DIFF, Bout
FS12:full_subtractor Port map(A(0), B(0), '0', E(18), C(9));
FS13:full_subtractor Port map(E(15), B(1), C(9), E(19), C(10));
FS14:full_subtractor Port map(E(16), B(2), C(10), E(20), C(11));
FS15:full_subtractor Port map(E(17), B(3), C(11), E(21),D(3));

--layer 8 -- S, I1, I0, Y
MUX09:mux_2x1 Port map(D(3), A(0), E(18), G(0));
MUX10:mux_2x1 Port map(D(3), E(15), E(19), G(1));
MUX11:mux_2x1 Port map(D(3), E(16), E(20), G(2));
MUX12:mux_2x1 Port map(D(3), E(17), E(21), G(3));

Q(3) <= NOT(D(0));
Q(2) <= NOT(D(1));
Q(1) <= NOT(D(2));
Q(0) <= NOT(D(3));

R(3) <= G(3);
R(2) <= G(2);
R(1) <= G(1);
R(0) <= G(0);

end Behavioral;
