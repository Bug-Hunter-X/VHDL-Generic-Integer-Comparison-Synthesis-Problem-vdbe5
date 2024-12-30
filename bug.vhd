In VHDL, a subtle error can occur when using generics with integer types and comparing them in conditional statements.  If the generic is declared as an integer, and you compare it to an integer literal within a conditional statement, then the synthesis tool might not correctly infer the logic. 

```vhdl
entity example is
  generic (
    g_value : integer := 10
  );
  port (
    clk : in std_logic;
    out_signal : out std_logic
  );
end entity;

architecture behavioral of example is
begin
  process (clk) is
  begin
    if rising_edge(clk) then
      if g_value = 10 then -- Potential problem here
        out_signal <= '1';
      else
        out_signal <= '0';
      end if;
    end if;
  end process;
end architecture;