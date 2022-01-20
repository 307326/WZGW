function [P] = pole(x1, y1, x2, y2, x3, y3, x4, y4)
    Punkty = [x1 y1; x2 y2; x4 y4; x3 y3];
    Pole = polyshape(Punkty);
    P = area(Pole);
end