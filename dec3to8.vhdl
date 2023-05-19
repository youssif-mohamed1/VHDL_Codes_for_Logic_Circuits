library ieee;
use ieee.std_logic_1164.all;

entity dec3to8 is
    port(
        a:in bit;
        b:in bit;
        e:in bit;
        y0:out bit;
        y1:out bit;
        y2:out bit;
        y3:out bit;
        y4:out bit;
        y5:out bit;
        y6:out bit;
        y7:out bit
    );
    end dec3to8;

    architecture equations of dec3to8 is

        begin
                y0<=(not b)and (not a) and (not e);
                y1<=(b)and (not a) and (not e);
                y2<=(not b)and (a) and (not e);
                y3<=(b)and (a) and (not e);
                y4<=(not b)and (not a) and e;
                y5<=(b)and (not a) and e;
                y6<=(not b)and (a) and e;
                y7<=(b)and (a) and e;
            end equations;