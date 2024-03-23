function S = compileSet(i,f,W,ti,tf,e,Abnd,b,R)

Sxdyn = inputFeasability(b,[ti,i(1)],[tf,f(1)],e,Abnd);
Sydyn = inputFeasability(b,[ti,i(2)],[tf,f(2)],e,Abnd);
Szdyn = inputFeasability(b,[ti,i(3)],[tf,f(3)],e,Abnd);

Sx = windowCheck(i,f,W,R,Sxdyn,Sydyn,Szdyn,1,2,3);
Sy = windowCheck(i,f,W,R,Sydyn,Szdyn,Sxdyn,2,3,1);
Sz = windowCheck(i,f,W,R,Szdyn,Sxdyn,Sydyn,3,2,1);

sizex = size(Sx);
sizey = size(Sy);
sizez = size(Sz);

len = sizex(1) + sizey(1) + sizez(1);

S = zeros([len 6]);

for a = 1:1:len
    if (a <= sizex(1))
        S(a,1) = Sx(a,1);
        S(a,2) = Sx(a,2);
        S(a,3) = Sx(a,3);
        S(a,4) = Sx(a,4);
        S(a,5) = Sx(a,5);
        S(a,6) = Sx(a,6);
    end
    if (a > sizex(1)) && (a <= (sizex(1) + sizey(1)))
        b = a - sizex(1);
        S(a,1) = Sx(b,1);
        S(a,2) = Sx(b,2);
        S(a,3) = Sx(b,3);
        S(a,4) = Sx(b,4);
        S(a,5) = Sx(b,5);
        S(a,6) = Sx(b,6);
    end
    if (a > (sizex(1) + sizex(1))) && (a <= (sizex(1) + sizey(1) + sizez(1)))
        c = a - (sizex(1) + sizey(1));
        S(a,1) = Sx(c,1);
        S(a,2) = Sx(c,2);
        S(a,3) = Sx(c,3);
        S(a,4) = Sx(c,4);
        S(a,5) = Sx(c,5);
        S(a,6) = Sx(c,6);
    end
end