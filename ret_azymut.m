function Az = ret_azymut(a,phi,dek,t)
    if ((cosd(phi)*sind(dek)-sind(phi)*cosd(dek)*cosd(t)) < 0) && ((-cosd(dek)*sind(t)) > 0)
        a = a+180;
    end
    if ((cosd(phi)*sind(dek)-sind(phi)*cosd(dek)*cosd(t)) < 0) && ((-cosd(dek)*sind(t)) < 0)
        a = a+180;
    end
    if ((cosd(phi)*sind(dek)-sind(phi)*cosd(dek)*cosd(t)) > 0)  && ((-cosd(dek)*sind(t)) < 0) 
        a = a+360;
    end
    Az = a;
end