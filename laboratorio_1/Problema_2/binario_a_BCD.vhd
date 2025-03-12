library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity binario_a_BCD is
    Port (
        S : in  STD_LOGIC_VECTOR (4 downto 0);  -- Entrada de 5 bits
        U : out STD_LOGIC_VECTOR (3 downto 0);  -- Unidades en BCD
        D : out STD_LOGIC_VECTOR (3 downto 0)   -- Decenas en BCD
    );
end binario_a_BCD;

architecture Behavioral of binario_a_BCD is
begin
    process(S)
        variable S_unsigned : UNSIGNED(4 downto 0);
        variable U_unsigned : UNSIGNED(3 downto 0);
        variable D_unsigned : UNSIGNED(3 downto 0);
        variable temp : UNSIGNED(4 downto 0);
    begin
        -- Inicializa las salidas
        U <= "0000";
        D <= "0000";

        -- Convertir S a unsigned
        S_unsigned := unsigned(S);

        -- Conversión directa de binario a BCD
        if S_unsigned >= CONV_UNSIGNED(30, 5) then  -- S >= 30
            D_unsigned := CONV_UNSIGNED(3, 4);  -- D = 3
            temp := S_unsigned - CONV_UNSIGNED(30, 5);
            U_unsigned := temp(3 downto 0);  -- Truncate to 4 bits
        elsif S_unsigned >= CONV_UNSIGNED(20, 5) then  -- S >= 20
            D_unsigned := CONV_UNSIGNED(2, 4);  -- D = 2
            temp := S_unsigned - CONV_UNSIGNED(20, 5);
            U_unsigned := temp(3 downto 0);  -- Truncate to 4 bits
        elsif S_unsigned >= CONV_UNSIGNED(10, 5) then  -- S >= 10
            D_unsigned := CONV_UNSIGNED(1, 4);  -- D = 1
            temp := S_unsigned - CONV_UNSIGNED(10, 5);
            U_unsigned := temp(3 downto 0);  -- Truncate to 4 bits
        else
            D_unsigned := CONV_UNSIGNED(0, 4);  -- D = 0
            U_unsigned := S_unsigned(3 downto 0);  -- Truncate to 4 bits
        end if;

        -- Convertir resultados de unsigned a std_logic_vector
        U <= std_logic_vector(U_unsigned);
        D <= std_logic_vector(D_unsigned);
    end process;
end Behavioral;