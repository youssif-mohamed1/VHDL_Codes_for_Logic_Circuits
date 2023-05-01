library ieee;
use ieee.std_logic_1164.all;

entity bit4addsub is 

	port ( 

        a, b: in bit_vector(3 downto 0);   
			cin: in bit;
			s : out bit_vector(3 downto 0);
            cout: out bit;
            v:out bit;
            negation:in bit
        );

end bit4addsub;

architecture equations of bit4addsub is 

    component bit4addar
port ( 
        a, b: in bit_vector(3 downto 0); 
			cin: in bit;
			s : out bit_vector(3 downto 0);
            cout: out bit;
            v:out bit
        );
    end component;
    signal b2:bit_vector(3 downto 0);
begin
    
    b2(0)<=b(0) xor negation;
    b2(1)<=b(1) xor negation;
    b2(2)<=b(2) xor negation;
    b2(3)<=b(3) xor negation;
    bit4: bit4addar port map(a,b2,cin,s,cout,v);
 end equations;