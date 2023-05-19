library ieee;
use ieee.std_logic_1164.all;


entity multi2bits is
    port(
    a,b:in bit_vector(1 downto 0 );
    s:out bit_vector(2 downto 0)
    );
end multi2bits;

architecture equations of multi2bits is

    component halfaddar 

    port(
        a:in bit;
        b:in bit;
        s:out bit;
        c:out bit
    );
    end component;

    signal x,y,z,v,cout:bit;
    
    begin
        s(0)<=a(0) and b(0);
        x<=a(1) and b(0);
        y<=a(0) and b(1);
        z<=a(1) and b(1);
        ha1: halfaddar port map(x,y,s(1),v);
        ha2: halfaddar port map(v,z,s(2),cout);       
        end equations;