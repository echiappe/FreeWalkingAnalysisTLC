function SpeedMapPlot(path)
flies = dir(path);
flies = flies(3:end);
flpv = 0;
thr = 2*60;
delta = 20;
VrNGAll = cell(5,1);
VfNGAll = cell(5,1);
PNGAll = cell(5,1);
NNGAll = cell(5,1);
DWNGAll = cell(5,1);
AngNGAll = cell(5,1);
VrRGAll = cell(5,1);
VfRGAll = cell(5,1);
PRGAll = cell(5,1);
NRGAll = cell(5,1);
DWRGAll = cell(5,1);
AngRGAll = cell(5,1);
for n = 1 : length(flies)
    dt = load([path flies(n).name '\DataLowRes.mat'], 'Flies');
    seq = dt.Flies.Seq;
    dt = dt.Flies.Data;
    for k = 1 : length(seq)
        switch seq{k}
            case '1NG'
                    for i = 1 : length(dt{k}.Bouts)
                        if length(dt{k}.Bouts{i}) > thr
                            vrb = dt{k}.Vr(dt{k}.Bouts{i});
                            vfb = dt{k}.Vf(dt{k}.Bouts{i});
                            flp = dt{k}.flp(dt{k}.Bouts{i});
                            vrb = vrb(flp ~= flpv);
                            vfb = vfb(flp ~= flpv);
                            [BoutVr, BoutVf, BoutP] = GetProbVec(vrb, vfb, delta);
                            NNGAll{1} = vertcat(NNGAll{1}, length(BoutVr));
                            VrNGAll{1} = vertcat(VrNGAll{1}, BoutVr);
                            VfNGAll{1} = vertcat(VfNGAll{1}, BoutVf);
                            PNGAll{1} = vertcat(PNGAll{1}, BoutP);
                            DWNGAll{1} = vertcat(DWNGAll{1}, dt{k}.WallDist(dt{k}.Bouts{i}(1:end-delta+1)));
                            AngNGAll{1} = vertcat(AngNGAll{1}, mod(dt{k}.Angle(dt{k}.Bouts{i}(1:end-delta+1)),360));
                        end
                    end
            case '1RG'
                    for i = 1 : length(dt{k}.Bouts)
                        if length(dt{k}.Bouts{i}) > thr
                            vrb = dt{k}.Vr(dt{k}.Bouts{i});
                            vfb = dt{k}.Vf(dt{k}.Bouts{i});
                            flp = dt{k}.flp(dt{k}.Bouts{i});
                            vrb = vrb(flp ~= flpv);
                            vfb = vfb(flp ~= flpv);
                            [BoutVr, BoutVf, BoutP] = GetProbVec(vrb, vfb, delta);
                            NRGAll{1} = vertcat(NRGAll{1}, length(BoutVr));
                            VrRGAll{1} = vertcat(VrRGAll{1}, BoutVr);
                            VfRGAll{1} = vertcat(VfRGAll{1}, BoutVf);
                            PRGAll{1} = vertcat(PRGAll{1}, BoutP);
                            DWRGAll{1} = vertcat(DWRGAll{1}, dt{k}.WallDist(dt{k}.Bouts{i}(1:end-delta+1)));
                            AngRGAll{1} = vertcat(AngRGAll{1}, mod(dt{k}.Angle(dt{k}.Bouts{i}(1:end-delta+1)),360));
                        end
                    end
            case '2.5NG'
                    for i = 1 : length(dt{k}.Bouts)
                        if length(dt{k}.Bouts{i}) > thr
                            vrb = dt{k}.Vr(dt{k}.Bouts{i});
                            vfb = dt{k}.Vf(dt{k}.Bouts{i});
                            flp = dt{k}.flp(dt{k}.Bouts{i});
                            vrb = vrb(flp ~= flpv);
                            vfb = vfb(flp ~= flpv);
                            [BoutVr, BoutVf, BoutP] = GetProbVec(vrb, vfb, delta);
                            NNGAll{2} = vertcat(NNGAll{2}, length(BoutVr));
                            VrNGAll{2} = vertcat(VrNGAll{2}, BoutVr);
                            VfNGAll{2} = vertcat(VfNGAll{2}, BoutVf);
                            PNGAll{2} = vertcat(PNGAll{2}, BoutP);
                            DWNGAll{2} = vertcat(DWNGAll{2}, dt{k}.WallDist(dt{k}.Bouts{i}(1:end-delta+1)));
                            AngNGAll{2} = vertcat(AngNGAll{2}, mod(dt{k}.Angle(dt{k}.Bouts{i}(1:end-delta+1)),360));
                        end
                    end
            case '2.5RG'
                    for i = 1 : length(dt{k}.Bouts)
                        if length(dt{k}.Bouts{i}) > thr
                            vrb = dt{k}.Vr(dt{k}.Bouts{i});
                            vfb = dt{k}.Vf(dt{k}.Bouts{i});
                            flp = dt{k}.flp(dt{k}.Bouts{i});
                            vrb = vrb(flp ~= flpv);
                            vfb = vfb(flp ~= flpv);
                            [BoutVr, BoutVf, BoutP] = GetProbVec(vrb, vfb, delta);
                            NRGAll{2} = vertcat(NRGAll{2}, length(BoutVr));
                            VrRGAll{2} = vertcat(VrRGAll{2}, BoutVr);
                            VfRGAll{2} = vertcat(VfRGAll{2}, BoutVf);
                            PRGAll{2} = vertcat(PRGAll{2}, BoutP);
                            DWRGAll{2} = vertcat(DWRGAll{2}, dt{k}.WallDist(dt{k}.Bouts{i}(1:end-delta+1)));
                            AngRGAll{2} = vertcat(AngRGAll{2}, mod(dt{k}.Angle(dt{k}.Bouts{i}(1:end-delta+1)),360));
                        end
                    end
            case '5NG'
                    for i = 1 : length(dt{k}.Bouts)
                        if length(dt{k}.Bouts{i}) > thr
                            vrb = dt{k}.Vr(dt{k}.Bouts{i});
                            vfb = dt{k}.Vf(dt{k}.Bouts{i});
                            flp = dt{k}.flp(dt{k}.Bouts{i});
                            vrb = vrb(flp ~= flpv);
                            vfb = vfb(flp ~= flpv);
                            [BoutVr, BoutVf, BoutP] = GetProbVec(vrb, vfb, delta);
                            NNGAll{3} = vertcat(NNGAll{3}, length(BoutVr));
                            VrNGAll{3} = vertcat(VrNGAll{3}, BoutVr);
                            VfNGAll{3} = vertcat(VfNGAll{3}, BoutVf);
                            PNGAll{3} = vertcat(PNGAll{3}, BoutP);
                            DWNGAll{3} = vertcat(DWNGAll{3}, dt{k}.WallDist(dt{k}.Bouts{i}(1:end-delta+1)));
                            AngNGAll{3} = vertcat(AngNGAll{3}, mod(dt{k}.Angle(dt{k}.Bouts{i}(1:end-delta+1)),360));
                        end
                    end
            case '5RG'
                    for i = 1 : length(dt{k}.Bouts)
                        if length(dt{k}.Bouts{i}) > thr
                            vrb = dt{k}.Vr(dt{k}.Bouts{i});
                            vfb = dt{k}.Vf(dt{k}.Bouts{i});
                            flp = dt{k}.flp(dt{k}.Bouts{i});
                            vrb = vrb(flp ~= flpv);
                            vfb = vfb(flp ~= flpv);
                            [BoutVr, BoutVf, BoutP] = GetProbVec(vrb, vfb, delta);
                            NRGAll{3} = vertcat(NRGAll{3}, length(BoutVr));
                            VrRGAll{3} = vertcat(VrRGAll{3}, BoutVr);
                            VfRGAll{3} = vertcat(VfRGAll{3}, BoutVf);
                            PRGAll{3} = vertcat(PRGAll{3}, BoutP);
                            DWRGAll{3} = vertcat(DWRGAll{3}, dt{k}.WallDist(dt{k}.Bouts{i}(1:end-delta+1)));
                            AngRGAll{3} = vertcat(AngRGAll{3}, mod(dt{k}.Angle(dt{k}.Bouts{i}(1:end-delta+1)),360));
                        end
                    end
            case '10NG'
                    for i = 1 : length(dt{k}.Bouts)
                        if length(dt{k}.Bouts{i}) > thr
                            vrb = dt{k}.Vr(dt{k}.Bouts{i});
                            vfb = dt{k}.Vf(dt{k}.Bouts{i});
                            flp = dt{k}.flp(dt{k}.Bouts{i});
                            vrb = vrb(flp ~= flpv);
                            vfb = vfb(flp ~= flpv);
                            [BoutVr, BoutVf, BoutP] = GetProbVec(vrb, vfb, delta);
                            NNGAll{4} = vertcat(NNGAll{4}, length(BoutVr));
                            VrNGAll{4} = vertcat(VrNGAll{4}, BoutVr);
                            VfNGAll{4} = vertcat(VfNGAll{4}, BoutVf);
                            PNGAll{4} = vertcat(PNGAll{4}, BoutP);
                            DWNGAll{4} = vertcat(DWNGAll{4}, dt{k}.WallDist(dt{k}.Bouts{i}(1:end-delta+1)));
                            AngNGAll{4} = vertcat(AngNGAll{4}, mod(dt{k}.Angle(dt{k}.Bouts{i}(1:end-delta+1)),360));
                        end
                    end
            case '10RG'
                    for i = 1 : length(dt{k}.Bouts)
                        if length(dt{k}.Bouts{i}) > thr
                            vrb = dt{k}.Vr(dt{k}.Bouts{i});
                            vfb = dt{k}.Vf(dt{k}.Bouts{i});
                            flp = dt{k}.flp(dt{k}.Bouts{i});
                            vrb = vrb(flp ~= flpv);
                            vfb = vfb(flp ~= flpv);
                            [BoutVr, BoutVf, BoutP] = GetProbVec(vrb, vfb, delta);
                            NRGAll{4} = vertcat(NRGAll{4}, length(BoutVr));
                            VrRGAll{4} = vertcat(VrRGAll{4}, BoutVr);
                            VfRGAll{4} = vertcat(VfRGAll{4}, BoutVf);
                            PRGAll{4} = vertcat(PRGAll{4}, BoutP);
                            DWRGAll{4} = vertcat(DWRGAll{4}, dt{k}.WallDist(dt{k}.Bouts{i}(1:end-delta+1)));
                            AngRGAll{4} = vertcat(AngRGAll{4}, mod(dt{k}.Angle(dt{k}.Bouts{i}(1:end-delta+1)),360));
                        end
                    end
            case '15NG'
                    for i = 1 : length(dt{k}.Bouts)
                        if length(dt{k}.Bouts{i}) > thr
                            vrb = dt{k}.Vr(dt{k}.Bouts{i});
                            vfb = dt{k}.Vf(dt{k}.Bouts{i});
                            flp = dt{k}.flp(dt{k}.Bouts{i});
                            vrb = vrb(flp ~= flpv);
                            vfb = vfb(flp ~= flpv);
                            [BoutVr, BoutVf, BoutP] = GetProbVec(vrb, vfb, delta);
                            NNGAll{5} = vertcat(NNGAll{5}, length(BoutVr));
                            VrNGAll{5} = vertcat(VrNGAll{5}, BoutVr);
                            VfNGAll{5} = vertcat(VfNGAll{5}, BoutVf);
                            PNGAll{5} = vertcat(PNGAll{5}, BoutP);
                            DWNGAll{5} = vertcat(DWNGAll{5}, dt{k}.WallDist(dt{k}.Bouts{i}(1:end-delta+1)));
                            AngNGAll{5} = vertcat(AngNGAll{5}, mod(dt{k}.Angle(dt{k}.Bouts{i}(1:end-delta+1)),360));
                        end
                    end
            case '15RG'
                    for i = 1 : length(dt{k}.Bouts)
                        if length(dt{k}.Bouts{i}) > thr
                            vrb = dt{k}.Vr(dt{k}.Bouts{i});
                            vfb = dt{k}.Vf(dt{k}.Bouts{i});
                            flp = dt{k}.flp(dt{k}.Bouts{i});
                            vrb = vrb(flp ~= flpv);
                            vfb = vfb(flp ~= flpv);
                            if flp(1) == 0
                                mean(flp)
%                                 [~, DeltaT, Dist, ~, ~, ~, ~] = PlotRawBout(dt{k}.Bouts{i}, dt{k}, '5º RG OddSkip');
                            end
                            [BoutVr, BoutVf, BoutP] = GetProbVec(vrb, vfb, delta);
                            NRGAll{5} = vertcat(NRGAll{5}, length(BoutVr));
                            VrRGAll{5} = vertcat(VrRGAll{5}, BoutVr);
                            VfRGAll{5} = vertcat(VfRGAll{5}, BoutVf);
                            PRGAll{5} = vertcat(PRGAll{5}, BoutP);
                            DWRGAll{5} = vertcat(DWRGAll{5}, dt{k}.WallDist(dt{k}.Bouts{i}(1:end-delta+1)));
                            AngRGAll{5} = vertcat(AngRGAll{5}, mod(dt{k}.Angle(dt{k}.Bouts{i}(1:end-delta+1)),360));
                        end
                    end
            otherwise
                
        end
    end
end

%%
vfStart=-5;
vfbin=1;
vfEnd=40;
% vfStart=5;
% vfbin=1;
% vfEnd=45;
% vfStart=-800;
% vfbin=30;
% vfEnd=800;
vrStart=-1000;
vrbin=30;
vrEnd=1000;
% vrStart=0;
% vrbin=10;
% vrEnd=360;
vfcent = vfStart: vfbin : vfEnd;
vrcent = vrStart: vrbin : vrEnd;
figure,
hold on
Ts = {'1NG';'2.5NG';'5NG';'10NG';'15NG';'1RG';'2.5RG';'5RG';'10RG';'15RG'};
for k = 1 : 5
    subplot(2,5,k)
    inds = find(VrNGAll{k} > -10000);
    [mapSum, ~, mapLength] = SpeedMapOccupancy(VrNGAll{k}(inds), ...
        VfNGAll{k}(inds), PNGAll{k}(inds),...
        vrcent, vfcent, vrbin, vfbin);
    mpx = mapSum./mapLength;%log(mapLength);%(mapSum);
    mpx(isnan(mpx)) = 0;
    mpx(mapLength < 5) = 0;
    imagesc(vrcent,vfcent, (mpx))
    caxis([-1 1])
    title(Ts{k})
%     caxis([-600 600])
%     caxis([0 25])
%     caxis([0 6])
    set(gca,'Ydir','Normal')
    xlabel('Vr (º/s)')
    ylabel('Vf (mm/s)')
    colorbar
%     colormap jet
    colormap redblue
    
    subplot(2,5,k+5)
    inds = find(VrRGAll{k} > -10000);
    [mapSum, ~, mapLength] = SpeedMapOccupancy(VrRGAll{k}(inds), VfRGAll{k}(inds), PRGAll{k}(inds),...
        vrcent, vfcent, vrbin, vfbin);
    mpx = mapSum./mapLength;%log(mapLength);%(mapSum);
    mpx(isnan(mpx)) = 0;
    mpx(mapLength < 5) = 0;
    imagesc(vrcent,vfcent, (mpx))
    caxis([-1 1])
    title(Ts{k+5})
%     caxis([-600 600])
%     caxis([0 6])
    set(gca,'Ydir','Normal')
    xlabel('Vr (º/s)')
    ylabel('Vf (mm/s)')
    colorbar
%     colormap jet
    colormap redblue
    disp(num2str(k))
end








