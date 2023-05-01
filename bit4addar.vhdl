library ieee;
use ieee.std_logic_1164.all;

entity bit4addar is 

    port ( 
        a, b: in bit_vector(3 downto 0); 
            cin: in bit;
            s : out bit_vector(3 downto 0);
            cout: out bit;
            v:out bit
        );

end bit4addar;

    architecture equations of bit4addar is
        component fulladdar

        port(
        a : in bit;
        b : in bit;
        cin:in bit;
        s: out bit;
        cout : out bit
    );
        end component;
        signal c1,c2,c3,c4 : bit;
        begin
            fa0 : fulladdar port map(a(0),b(0),cin,s(0),c1);
            fa1 : fulladdar port map(a(1),b(1),c1,s(1),c2);
            fa2 : fulladdar port map(a(2),b(2),c2,s(2),c3);
            fa3 : fulladdar port map(a(3),b(3),c3,s(3),c4);
            cout <= c4;
            v<= (c3 xor c4);
            end equations;