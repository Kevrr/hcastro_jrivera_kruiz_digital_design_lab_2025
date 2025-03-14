library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sumador_4bits_display_tb is
end sumador_4bits_display_tb;

architecture Behavioral of sumador_4bits_display_tb is
    -- Component declaration for the unit under test (UUT)
    component sumador_4bits_display is
        Port (
            A : in  STD_LOGIC_VECTOR (3 downto 0);
            B : in  STD_LOGIC_VECTOR (3 downto 0);
            units_seg : out STD_LOGIC_VECTOR (6 downto 0);
            tens_seg : out STD_LOGIC_VECTOR (6 downto 0);
            S : out STD_LOGIC_VECTOR (4 downto 0)
        );
    end component;

    -- Inputs
    signal A : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal B : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');

    -- Outputs
    signal units_seg : STD_LOGIC_VECTOR (6 downto 0);
    signal tens_seg : STD_LOGIC_VECTOR (6 downto 0);
    signal S : STD_LOGIC_VECTOR (4 downto 0);

    -- Clock period definition
    constant clk_period : time := 10 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: sumador_4bits_display
        Port map (
            A => A,
            B => B,
            units_seg => units_seg,
            tens_seg => tens_seg,
            S => S
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test case 1: A = 3, B = 2
        A <= "0011"; B <= "0010";
        wait for clk_period;
        assert (S = "00101") report "Test case 1 failed" severity error;

        -- Test case 2: A = 7, B = 8
        A <= "0111"; B <= "1000";
        wait for clk_period;
        assert (S = "01111") report "Test case 2 failed" severity error;

        -- Test case 3: A = 9, B = 6
        A <= "1001"; B <= "0110";
        wait for clk_period;
        assert (S = "10111") report "Test case 3 failed" severity error;

        -- Test case 4: A = 4, B = 5
        A <= "0100"; B <= "0101";
        wait for clk_period;
        assert (S = "01101") report "Test case 4 failed" severity error;

        -- Test case 5: A = 0, B = 0
        A <= "0000"; B <= "0000";
        wait for clk_period;
        assert (S = "00000") report "Test case 5 failed" severity error;

        wait;
    end process;

end Behavioral;