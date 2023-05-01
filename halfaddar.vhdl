library ieee;
use ieee.std_logic_1164.all;
entity halfaddar is
    port(
        a:in std_ulogic;
        b:in std_ulogic;
        s:out std_ulogic;
        c:out std_ulogic
    );
    end halfaddar;
    architecture equations of halfaddar is
        begin 
        s<= a xor b;
        c<= a and b;
        end equations;