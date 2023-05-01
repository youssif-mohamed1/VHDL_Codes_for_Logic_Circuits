library ieee;
use ieee.std_logic_1164.all;

entity bcd4bits is 

port(
a:in bit_vector(3 downto 0);
b:in bit_vector(3 downto 0);
cin:in bit;
sum : out bit_vector(3 downto 0);
plus6:inout bit;
carryout: out bit

);
end bcd4bits;

architecture equations of bcd4bits is

component bit4addar
port ( 
        a, b: in bit_vector(3 downto 0); 
            cin: in bit;
            s : out bit_vector(3 downto 0);
            cout: out bit;
            v:out bit
        );
end component;

signal sum1,av,bv:bit_vector(3 downto 0); 
signal an1,an2,carry,sig,carry1:bit;

    begin
        bit41:bit4addar port map(a,b,cin,sum1,carry1);

        an1<=sum1(3) and sum1(2);
        an2<=sum1(3) and sum1(1);

        sig<=carry1 or an1 or an2;

        bv(0)<='0';
        bv(1)<=sig;
        bv(2)<=sig;
        bv(3)<='0';

        bit4:bit4addar port map(sum1,bv,'0',sum,carryout);
        
        plus6<=sig;
    end equations;
