library ieee;
use ieee.std_logic_1164.all;

entity bcd16bits is
    port(
        a,b:in bit_vector(15 downto 0);
        su:out bit_vector(15 downto 0);
        po:out bit;
        cin:in bit
        --cout:inout bit
    );
    end bcd16bits;

    architecture equations of bcd16bits is
        component bcd8bits
        port(

        a,b:in bit_vector(7 downto 0);
        s:out bit_vector(7 downto 0);
        plus:out bit;
        cin:in bit;
        cout:inout bit
        );
        end component;
        
signal a1,a2,b1,b2,s1,s2:bit_vector(7 downto 0);
signal p1,p2,cou,p:bit;

    begin
        a1(0)<=a(0);
        a1(1)<=a(1);
        a1(2)<=a(2);
        a1(3)<=a(3);
        a1(4)<=a(4);
        a1(5)<=a(5);
        a1(6)<=a(6);
        a1(7)<=a(7);

        a2(0)<=a(8);
        a2(1)<=a(9);
        a2(2)<=a(10);
        a2(3)<=a(11);
        a2(4)<=a(12);
        a2(5)<=a(13);
        a2(6)<=a(14);
        a2(7)<=a(15);
        
        b1(0)<=b(0);
        b1(1)<=b(1);
        b1(2)<=b(2);
        b1(3)<=b(3);
        b1(4)<=b(4);
        b1(5)<=b(5);
        b1(6)<=b(6);
        b1(7)<=b(7);

        b2(0)<=b(8);
        b2(1)<=b(9);
        b2(2)<=b(10);
        b2(3)<=b(11);
        b2(4)<=b(12);
        b2(5)<=b(13);
        b2(6)<=b(14);
        b2(7)<=b(15);
        
        bcd8: bcd8bits port map(a1,b1,s1,p1,'0',p);
          
        bcd82: bcd8bits port map(a2,b2,s2,po,p1,cou);
        
        su(0)<=s1(0);
        su(1)<=s1(1);
        su(2)<=s1(2);
        su(3)<=s1(3);
        su(4)<=s1(4);
        su(5)<=s1(5);
        su(6)<=s1(6);
        su(7)<=s1(7);

        su(8)<=s2(0);
        su(9)<=s2(1);
        su(10)<=s2(2);
        su(11)<=s2(3);
        su(12)<=s2(4);
        su(13)<=s2(5);
        su(14)<=s2(6);
        su(15)<=s2(7);

       -- po<=cout;

        end equations;