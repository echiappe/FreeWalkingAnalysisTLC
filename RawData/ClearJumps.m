function [Vf, Vs, Vr, Vt, Angle, nJ, flp] = ClearJumps(Vf, Vs, Vr, Vt, Angle, flp, iOr)
if (max(diff(Vt)) > 15)
    [~,locsvf] = findpeaks(abs(diff(Vt)),'MinPeakHeight',20, 'MinPeakDistance',6);
    vftmp = Vf;
    FdChange = [];
    locsvf = vertcat(1,locsvf, length(Vf));
    nJ = length(locsvf-1);
    for i = 2 : length(locsvf)
        aux = vftmp(locsvf(i-1):locsvf(i));
        aux(isnan(aux)) = [];
        if (mean(aux) < 0)
            flp(locsvf(i-1):locsvf(i)) = abs(flp(locsvf(i-1):locsvf(i))-180);
            Vf(locsvf(i-1):locsvf(i)) = -Vf(locsvf(i-1):locsvf(i));
            Vs(locsvf(i-1):locsvf(i)) = -Vs(locsvf(i-1):locsvf(i));
            Vr(locsvf(i-1):locsvf(i)) = Vr(locsvf(i-1):locsvf(i));
            Angle(locsvf(i-1):locsvf(i)) = Angle(locsvf(i-1):locsvf(i))-180;
        end
        if (locsvf(i)+5 < length(Vf))
            if (locsvf(i) > 6)
                Vf(locsvf(i)-5:locsvf(i)+5) = 0;%mean(Vf(locsvf(i)-5:locsvf(i)-3));
                Vs(locsvf(i)-5:locsvf(i)+5) = 0;%mean(Vs(locsvf(i)-5:locsvf(i)-3));
                Vr(locsvf(i)-5:locsvf(i)+5) = 0;%mean(Vr(locsvf(i)-5:locsvf(i)-3));
            elseif (locsvf(i) > 2)
                Vf(locsvf(i)-2:locsvf(i)+5) = 0;%(Vf(locsvf(i)-2));
                Vs(locsvf(i)-2:locsvf(i)+5) = 0;%(Vs(locsvf(i)-2));
                Vr(locsvf(i)-2:locsvf(i)+5) = 0;%(Vr(locsvf(i)-2));
            else
                Vf(locsvf(i):locsvf(i)+5) = 0;%(Vf(locsvf(i)+4));
                Vs(locsvf(i):locsvf(i)+5) = 0;%(Vs(locsvf(i)+4));
                Vr(locsvf(i):locsvf(i)+5) = 0;%(Vr(locsvf(i)+4));
            end
        else
            Vf(locsvf(i)) = 0;%(Vf(locsvf(i)+4));
            Vs(locsvf(i)) = 0;%(Vs(locsvf(i)+4));
            Vr(locsvf(i)) = 0;%(Vr(locsvf(i)+4));
        end
    end
end
Vt = sqrt(Vf.*Vf + Vs.*Vs);
nJ = 0;
end

