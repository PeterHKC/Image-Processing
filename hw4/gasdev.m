function [result, iset, gset] = gasdev(iset, gset)
    if iset == 0
        rsq = 2.0;
        while(rsq >= 1.0 || rsq == 0.0)
            v1 = 2.0*rand()-1.0;
            v2 = 2.0*rand()-1.0;
            rsq = v1*v1+v2*v2;
        end
        fac = sqrt(-2.0*log(rsq)/rsq);
        gset = v1*fac;
        iset = 1;
        result = v2*fac;
    else
        iset = 0;
        result = gset;
    end
end