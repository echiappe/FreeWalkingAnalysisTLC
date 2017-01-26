function [mapSum, mapStd, mapLength] = SpeedMapOccupancy(Vr, Vf, MP, vrcent, vfcent, vrbin, vfbin)

if nargin < 4
vfStart=-5;
vfbin=1;
vfEnd=50;
vrStart=-800;
vrbin=10;
vrEnd=800;
    
    vfcent = vfStart: vfbin : vfEnd;
    vrcent = vrStart: vrbin : vrEnd;
end
for x = 1 : length(vfcent)
    tmpa=find(Vf >= vfcent(1)+(x-1)*vfbin);
    tmpb=find(Vf < vfcent(1)+x*vfbin);
    tmpx=tmpa(ismembc(tmpa,tmpb));
    for y = 1 : length(vrcent)
        tmpa=find(Vr >= vrcent(1)+(y-1)*vrbin);
        tmpb=find(Vr < vrcent(1)+y*vrbin);
        tmpy=tmpa(ismembc(tmpa,tmpb));
        tmp=tmpx(ismembc(tmpx,tmpy));
        if ~isempty(tmp)
            MPMDVl{x,y} = length(MP(tmp));
            MPMDVstd{x,y} = std(MP(tmp));
            MPMDVs{x,y} = sum(MP(tmp));
        else
            MPMDVl{x,y} = 0;
            MPMDVstd{x,y} = 0;
            MPMDVs{x,y} = 0;
        end
    end
end

mapLength = cell2mat(MPMDVl);
mapSum = cell2mat(MPMDVs);
mapStd = cell2mat(MPMDVstd);
end

