library ieee;
use ieee.std_logic_1164.all;

entity bcd8bits is

    port(

    a,b:in bit_vector(7 downto 0);
    s:out bit_vector(7 downto 0);
    plus:out bit;
    cin:in bit;
    cout:inout bit
    );
    
    end bcd8bits;

    architecture equations of bcd8bits is

        component bcd4bits
        port(
        a:in bit_vector(3 downto 0);
        b:in bit_vector(3 downto 0);
        cin:in bit;
        sum : out bit_vector(3 downto 0);
        plus6:inout bit;
        carryout: out bit

        );
        end component;

        signal a1,a2,b1,b2,s1,s2:bit_vector(3 downto 0);
        signal pluss,cou,p:bit;

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
            
        b4caddard: bcd4bits port map(a1,b1,cin,s1,pluss,cou);
        b4caddard2: bcd4bits port map(a2,b2,pluss,s2,cout,p);
        
        s(0)<=s1(0);
        s(1)<=s1(1);
        s(2)<=s1(2);
        s(3)<=s1(3);
        
        s(4)<=s2(0);
        s(5)<=s2(1);
        s(6)<=s2(2);
        s(7)<=s2(3);
        
        plus<=pluss; 
        end equations;