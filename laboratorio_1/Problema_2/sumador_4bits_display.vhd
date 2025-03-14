library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sumador_4bits_display is
    Port (
        A : in  STD_LOGIC_VECTOR (3 downto 0);  -- Entradas de 4 bits
        B : in  STD_LOGIC_VECTOR (3 downto 0);  -- Entradas de 4 bits
        units_seg : out STD_LOGIC_VECTOR (6 downto 0);  -- Display de unidades
        tens_seg : out STD_LOGIC_VECTOR (6 downto 0);   -- Display de decenas
        S : buffer STD_LOGIC_VECTOR (4 downto 0)   -- Salida de 5 bits, tipo buffer
    );
end sumador_4bits_display;

architecture Behavioral of sumador_4bits_display is
    signal U, D : STD_LOGIC_VECTOR (3 downto 0);  -- Unidades y decenas en BCD
begin

    -- Instancia del módulo sumador
    sumador_inst: entity work.suma
        port map (
            A => A,
            B => B,
            S => S
        );

    -- Conversión a BCD
    bcd_inst: entity work.binario_a_BCD
        port map (
            S => S,
            U => U,
            D => D
        );

    -- Displays de 7 segmentos
    display_units: entity work.display_7seg
        port map (
            BCD => U,
            seg => units_seg
        );

    display_tens: entity work.display_7seg
        port map (
            BCD => D,
            seg => tens_seg
        );

end Behavioral;