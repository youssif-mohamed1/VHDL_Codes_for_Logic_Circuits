library ieee ;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
----------------------------------------------------
entity counter is

generic(n: natural :=4);
port(
    clock:    in  std_logic;
    clear:    in  std_logic;
    count:    in  std_logic;
    Q:        out std_logic_vector(n-1 downto 0)
);
end counter;
----------------------------------------------------
architecture behv of counter is
    signal Pre_Q: std_logic_vector(n-1 downto 0):="0000";
begin
    -- behavior describe the counter
    process(clock, count, clear)
    begin
        if Pre_Q="1010" then 
        Pre_Q<="0000";
        else 
    if clear = '1' then
         Pre_Q <= std_logic_vector(unsigned(Pre_Q) - unsigned(Pre_Q));
    elsif (clock='1' and clock'event) then
        if count = '1' then
        Pre_Q <= std_logic_vector(unsigned(Pre_Q) + 1);
        end if;
    end if;
    end if;
    end process;

    -- concurrent assignment statement
    Q <= Pre_Q;
end behv;