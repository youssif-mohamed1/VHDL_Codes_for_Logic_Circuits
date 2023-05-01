library ieee;
use ieee.std_logic_1164.all;

entity bit8as is
port (
a,b:in bit_vector(7 downto 0);
c:in bit;
sum:out bit_vector(7 downto 0);
coutter:out bit;
neg :in bit
);
    end bit8as;
architecture equations of bit8as is

    component bit4addsub
    port ( 

        a, b: in bit_vector(3 downto 0);   
			cin: in bit;
			s : out bit_vector(3 downto 0);
            cout: out bit;
            v:out bit;
            negation:in bit
        );
    end component;
    signal a1,a2,b1,b2,s1,s2:bit_vector(3 downto 0);
    signal p1,p2,carry:bit;
    begin
        a1(0)<=a(0);
        a1(1)<=a(1);
        a1(2)<=a(2);
        a1(3)<=a(3);

        a2(0)<=a(4);
        a2(1)<=a(5);
        a2(2)<=a(6);
        a2(3)<=a(7);

        b1(0)<=b(0);
        b1(1)<=b(1);
        b1(2)<=b(2);
        b1(3)<=b(3);

        b2(0)<=b(4);
        b2(1)<=b(5);
        b2(2)<=b(6);
        b2(3)<=b(7);

    b4as1:bit4addsub port map(a1,b1,c,s1,carry,p1,neg);
    b4as2:bit4addsub port map(a2,b2,carry,s2,coutter,p2,neg);

        sum(0)<=s1(0);
        sum(1)<=s1(1);
        sum(2)<=s1(2);
        sum(3)<=s1(3);

        sum(4)<=s2(0);
        sum(5)<=s2(1);
        sum(6)<=s2(2);
        sum(7)<=s2(3);
    end equations;