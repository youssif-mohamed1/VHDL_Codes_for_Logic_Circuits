library ieee;
use ieee.std_logic_1164.all;

entity fulladdar is
    port(
        a : in bit;
        b : in bit;
        cin:in bit;
        s: out bit;
        cout : out bit
    );
    end fulladdar;
    architecture equations of fulladdar is 
    begin
        s<=a xor b xor cin;
        cout<= (a and b) or ((a xor b) and cin);
    end equations;