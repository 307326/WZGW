function [L0,num] = ret_Lo(L)

    if L>14 && L<16.5
        L0 = 15;
        num = 5;
    end
    if L>16.5 && L<19.5
        L0 = 15;
        num = 6;
    end
    
    if L>19.5 && L<22.5
        L0 = 21;
        num = 7;
    end
    
    if L>22.5 && L<24
        L0 = 24;
        num = 8;
    end

end