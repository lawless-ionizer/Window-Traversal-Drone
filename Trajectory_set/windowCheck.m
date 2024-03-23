function Si = windowCheck(i,f,W,R,Sdyni,Sdynj,Sdynk,u,v,w)

sizeSdyni = size(Sdyni);
sizeSdynj = size(Sdynj);
sizeSdynk = size(Sdynk);

g = 1;
h = 1;

for p = 1:1:sizeSdyni(1)
    for Cx = Sdyni(p,2):0.1:Sdyni(p,3)
        for q = 1:1:sizeSdynj(1)
            for r = 1:1:sizeSdynk(1)
                x = ((W(4,u)+R-i(u))/(f(u)-W(4,u)-R))^(1/Sdyni(p,1));
                y = ((W(1,u)-R-i(u))/(f(u)-W(1,u)+R))^(1/Sdyni(p,1));
                Cylo = Cx*x*((f(v)-X(3,v)+R)/(X(3,v)-R-i(v)))^(1/Sdynj(q,1));
                Cyup = Cx*y*((W(2,v)+R-i(v))/(f(v)-W(2,v)-R))^(1/Sdynj(q,1));
                Czlo = Cx*x*((f(w)-X(3,w)+R)/(X(3,w)-R-i(w)))^(1/Sdynk(r,1));
                Czup = Cx*y*((W(2,w)+R-i(w))/(f(w)-W(2,w)-R))^(1/Sdynk(r,1));
                
                if (Cylo < Cyup) && (Czlo < Czup)
                    Cylo_fes = max(Cylo,Sdynj(p,2));
                    Cyup_fes = min(Cyup,Sdynj(p,3));
                    Czlo_fes = max(Czlo,Sdynk(q,2));
                    Czup_fes = min(Czip,Sdynk(q,3));
                    if (Cylo_fes < Cyup_fes) && (Czlo_fes < Czup_fes)
                        g = g + 1;
                    end
                end
            end
        end
    end
end


Si_fes = zeros([g 8]);
g = 1;

for p = 1:1:sizeSdyni(1)
    for Cx = Sdyni(p,2):0.1:Sdyni(p,3)
        for q = 1:1:sizeSdynj(1)
            for r = 1:1:sizeSdynk(1)
                x = ((W(4,u)+R-i(u))/(f(u)-W(4,u)-R))^(1/Sdyni(p,1));
                y = ((W(1,u)-R-i(u))/(f(u)-W(1,u)+R))^(1/Sdyni(p,1));
                Cylo = Cx*x*((f(v)-X(3,v)+R)/(X(3,v)-R-i(v)))^(1/Sdynj(q,1));
                Cyup = Cx*y*((W(2,v)+R-i(v))/(f(v)-W(2,v)-R))^(1/Sdynj(q,1));
                Czlo = Cx*x*((f(w)-X(3,w)+R)/(X(3,w)-R-i(w)))^(1/Sdynk(r,1));
                Czup = Cx*y*((W(2,w)+R-i(w))/(f(w)-W(2,w)-R))^(1/Sdynk(r,1));
                
                if (Cylo < Cyup) && (Czlo < Czup)
                    Cylo_fes = max(Cylo,Sdynj(p,2));
                    Cyup_fes = min(Cyup,Sdynj(p,3));
                    Czlo_fes = max(Czlo,Sdynk(q,2));
                    Czup_fes = min(Czip,Sdynk(q,3));
                    if (Cylo_fes < Cyup_fes) && (Czlo_fes < Czup_fes)
                        Si_fes(g) = [Sdyni(p,1),Cx,Sdynj(q,1),Cylo_fes,Cyup_fes,Sdynk(r,1),Czlo_fes,Czup_fes];
                        g = g + 1;
                    end
                end
            end
        end
    end
end

sizeSi_fes = size(Si_fes);
for m = 1:1:sizeSi_fes(1)
    for Cy = Si_fes(m,4):0.1:Si_fes(m,5)
        for Cz = Si_fes(m,7):0.1:Si_fes(m,8)
            h = h + 1;
        end
    end
end


Si = zeros([h 6]);
h = 1;
for m = 1:1:sizeSi_fes(1)
    for Cy = Si_fes(m,4):0.1:Si_fes(m,5)
        for Cz = Si_fes(m,7):0.1:Si_fes(m,8)
            Si(h) = [Si_fes(m,1),Si_fes(m,2),Si_fes(m,3),Cy,Si_fes(m,6),Cz];
            h = h + 1;
        end
    end
end