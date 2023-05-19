library ieee;
use ieee.std_logic_1164.all;

entity comparator4bits is
    port(
    a:in bit_vector(3 downto 0);
    b:in bit_vector(3 downto 0);
    x,y,z:out bit
    );
    end comparator4bits;

    architecture equations of comparator4bits is
        
        signal x0,x1,x2,x3:bit;
        signal y0,y1,y2,y3,y4,y5,y6,y7:bit; 

        begin


            x0<=a(0)xnor b(0);
            x1<=a(1)xnor b(1);
            x2<=a(2)xnor b(2);
            x3<=a(3)xnor b(3);
     
            y0<=a(3)and (not b(3));
            y1<=a(2)and (not b(2)) and x3;
            y2<=a(1)and (not b(1)) and x3 and x2;
            y3<=a(0)and (not b(0)) and x3 and x2 and x1;
           
            y4<=(not a(3))and b(3);
            y5<=(not a(2))and b(2) and x3;
            y6<=(not a(1))and b(1) and x3 and x2;
            y7<=(not a(0))and b(0) and x3 and x2 and x1;
           
            x<=y0 or y1 or y2 or y3; -- a is greater
            y<=y4 or y5 or y6 or y7; -- b is greater
            z<=x0 and x1 and x2 and x3 ; -- equal

            end equations;