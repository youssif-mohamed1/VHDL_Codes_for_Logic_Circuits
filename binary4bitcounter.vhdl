library ieee;
use ieee.std_logic_1164.all;

entity binary4bitcounter is
   
   port( count:in bit;
    a:inout bit_vector(3 downto 0);
    nstage:out bit;
    clk:in std_logic
   );
   end binary4bitcounter;
    architecture equations of binary4bitcounter is
    component Tff 
        port(
        t:in bit;
        c:in std_logic;
        q:inout bit
        );
    end component;
signal a1,a2,a3,notused:bit;
begin

    tff1:Tff port map(count,clk,a(0));
    a1<=a(0) and count;
    
    tff2:Tff port map(a1,clk,a(1));
    a2<=a(1) and a1;

    tff3:Tff port map(a2,clk,a(2));
    a3<=a2 and a(2);

    tff4:Tff port map(a3,clk,a(3));
    nstage<= a3 and a(3);
    
    end equations;