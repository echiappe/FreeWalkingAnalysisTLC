function [BoutVr, BoutVf, BoutP] = GetProbVec(Vr, Vf, delta)
    inds = Vr;
    inds(inds>0) = 1;
    inds(inds<=0) = -1;
    
    aux1 = inds(1:end-delta+1);
    aux2 = inds(delta:end);
%     aux3 = aux1+aux2;

    BoutVr = Vr(1:end-delta+1);
    BoutVf = Vf(1:end-delta+1);
    BoutP = aux2;
%     BoutP = Vr(delta:end);
end