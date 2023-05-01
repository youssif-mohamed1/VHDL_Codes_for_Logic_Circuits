library ieee;
use ieee.std_logic_1164.all;

entity bit16as is
port(
a,b:in bit_vector(15 downto 0);
cin:in bit;
sum:out bit_vector(15 downto 0);
cout:out bit;
negative:in bit
);
    end bit16as;

    architecture equations of bit16as is

        component bit8as
        port (
a,b:in bit_vector(7 downto 0);
c:in bit;
sum:out bit_vector(7 downto 0);
coutter:out bit;
neg :in bit
);
        end component;
signal a1,a2,b1,b2,s1,s2: bit_vector(7 downto 0);
signal c1:bit;
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
bit8as111: bit8as port map(a1,b1,cin,s1,c1,negative);
bit8as112: bit8as port map(a2,b2,c1,s2,cout,negative);
sum(0)<=s1(0);
sum(1)<=s1(1);
sum(2)<=s1(2);
sum(3)<=s1(3);
sum(4)<=s1(4);
sum(5)<=s1(5);
sum(6)<=s1(6);
sum(7)<=s1(7);

sum(8)<=s2(0);
sum(9)<=s2(1);
sum(10)<=s2(2);
sum(11)<=s2(3);
sum(12)<=s2(4);
sum(13)<=s2(5);
sum(14)<=s2(6);
sum(15)<=s2(7);
        end equations;