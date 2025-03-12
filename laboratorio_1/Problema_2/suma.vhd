library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity suma is
    Port (
        A : in  STD_LOGIC_VECTOR (3 downto 0);
        B : in  STD_LOGIC_VECTOR (3 downto 0);
        S : out STD_LOGIC_VECTOR (4 downto 0)
    );
end suma;

architecture Behavioral of suma is
    signal C0, C1, C2, C3 : STD_LOGIC;
begin

    -- Primer bit
    S(0) <= A(0) XOR B(0);
    C0   <= A(0) AND B(0);

    -- Segundo bit
    S(1) <= (A(1) XOR B(1)) XOR C0;
    C1   <= (A(1) AND B(1)) OR (C0 AND (A(1) XOR B(1)));

    -- Tercer bit
    S(2) <= (A(2) XOR B(2)) XOR C1;
    C2   <= (A(2) AND B(2)) OR (C1 AND (A(2) XOR B(2)));

    -- Cuarto bit
    S(3) <= (A(3) XOR B(3)) XOR C2;
    C3   <= (A(3) AND B(3)) OR (C2 AND (A(3) XOR B(3)));

    -- Quinto bit (Cout)
    S(4) <= C3;  -- Este es el bit extra para manejar hasta 30

end Behavioral;