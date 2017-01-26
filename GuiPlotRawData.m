function GuiPlotRawData()
%% Get Directory and Individual Fly Folders
path = uigetdir;
path = [path '\'];
flies = dir([path, '\*']);
flies = flies(3:end);
flies(~[flies.isdir]) = []; 
NFlies = length(flies);
currentFly = 1;
%% Load DataFile Current Fly
dt = load([path flies(currentFly).name '\DataLowRes.mat']);
dt = dt.Flies;
nParts = length(dt.Data);
% nParts = 10;
currentPart = 1;
%% Define GUI elements
f = figure('Visible', 'off', 'Position', [360, 300, 500, 320]);
f.Name = 'NavigateVideo';
movegui(f, 'center')
f.Visible = 'on';
NFlyplus = uicontrol('Style', 'pushbutton', 'String', '+', 'Position', [120, 290, 20, 20], ...
    'Callback', {@NFlyplus_Callback});
NFlyplus.Units = 'normalized';
NFlyminus = uicontrol('Style', 'pushbutton', 'String', '-', 'Position', [150, 290, 20, 20],...
    'Callback', {@NFlyminus_Callback});
NFlyminus.Units = 'normalized';
NFlyT = uicontrol(f,'Style','edit','String','FlyNo','Position',[50, 290, 50, 20], ...
    'Callback', {@NFlyT_CallBack});
NFlyT.Units = 'normalized';
NPartplus = uicontrol('Style', 'pushbutton', 'String', '+', 'Position', [200+120, 290, 20, 20], ...
    'Callback', {@NPartplus_Callback});
NPartplus.Units = 'normalized';
NPartminus = uicontrol('Style', 'pushbutton', 'String', '-', 'Position', [200+150, 290, 20, 20],...
    'Callback', {@NPartminus_Callback});
NPartminus.Units = 'normalized';
NPartT = uicontrol(f,'Style','edit','String','PartNo','Position',[200+50, 290, 50, 20], ...
    'Callback', {@NPartT_CallBack});
NPartT.Units = 'normalized';
SMaps = uicontrol('Style', 'pushbutton', 'String', 'SpeedMapAll', 'Position', [200+180, 290, 100, 20], ...
    'Callback', {@SMaps_Callback});
SMaps.Units = 'normalized';
for n = 1 : nParts
   seq = dt.Seq;
   if n == floor(currentPart)
        nseq{n} = uicontrol('Style','text','position',[50+20*n, 290-30, 25, 10],'String', seq{n}, 'BackgroundColor', 'r');       
   else
        nseq{n} = uicontrol('Style','text','position',[50+20*n, 290-30, 25, 10],'String', seq{n}, 'BackgroundColor', 'w');
   end
   nseq{n}.Units = 'normalized';
end

ha = axes('Units', 'pixels', 'Position', [50, 50, 420, 200]);
ha.Units = 'normalized';
axes(ha);
axis off;
%% Plot
%     t = (1 : length(dt.VfRaw))/60;
%     plot(t,dt.VfRaw);
%% CallBacks
    function NFlyplus_Callback(source, eventdata)
        if currentFly <= NFlies
            currentFly = currentFly + 1;
            updateAxes(currentFly,currentPart);
        end
    end
    function NFlyminus_Callback(source, eventdata)
        if currentFly > 1
            currentFly = currentFly - 1;
            updateAxes(currentFly,currentPart);
        end
    end
    function NFlyT_CallBack(hObject, eventdata, handles)
        input = str2double(get(hObject,'String'));
        if isnan(input)
            errordlg('You must enter a numeric value','Invalid Input','modal')
            uicontrol(hObject)
            return
        else
            input = floor(input);
            if input <= NFlies && input >= 1
                currentFly = input;
                updateAxes(currentFly,currentPart);
            else
                currentFly = 1;
                updateAxes(currentFly,currentPart); 
            end
        end
    end
    function NPartplus_Callback(source, eventdata)
        if currentPart <= nParts
            currentPart = currentPart + 1;
            updateAxes(currentFly,currentPart);
        end
    end
    function NPartminus_Callback(source, eventdata)
        if currentPart > 1
            currentPart = currentPart - 1;
            updateAxes(currentFly,currentPart);
        end
    end
    function NPartT_CallBack(hObject, eventdata, handles)
        input = str2double(get(hObject,'String'));
        if isnan(input)
            errordlg('You must enter a numeric value','Invalid Input','modal')
            uicontrol(hObject)
            return
        else
            input = floor(input);
            if input <= nParts && input >= 1
                currentPart = input;
                updateAxes(currentFly,currentFly);
            else
                currentPart = 1;
                updateAxes(currentFly,currentPart); 
            end
        end
    end
    function SMaps_Callback(source, eventdata)
        SpeedMapPlot(path);
    end
%% UpdateAxes
    function updateAxes(cFly, cpart)
        dt = load([path flies(cFly).name '\DataLowRes.mat']);
        dt = dt.Flies;
        nParts = length(dt.Data);
        if cpart > nParts
            cpart = 1;
            currentPart = 1;
        end
        NFlyT.String = num2str(cFly);
        NPartT.String = num2str(cpart);
        for k = 1 : nParts
            seq = dt.Seq;
            if k == floor(currentPart)
                nseq{k}.String = seq{k};
                set(nseq{k},'BackgroundColor',[1 0 0]);
            else
                nseq{k}.String = seq{k};
                set(nseq{k},'BackgroundColor',[1 1 1]);
            end
            nseq{k}.Units = 'normalized';
        end
        axes(ha);
        cla reset;
        t = (1 : length(dt.Data{currentPart}.Vf))/60;
        plot(t, zeros(length(t),1), 'color',[0.8 0.8 0.8], 'linewidth', 2)
        hold on
        plot(t,dt.Data{currentPart}.Vr, 'color',[0.2 0.5 0.2], 'linewidth', 1.5);
        hold on
        plot(t(dt.Data{currentPart}.flp == 0),dt.Data{currentPart}.Vr(dt.Data{currentPart}.flp == 0), 'r', 'linewidth', 1.5);
        hold on
        plot(t, zeros(length(t),1)-1300, 'color',[0.8 0.8 0.8], 'linewidth', 1)
        hold on
        plot(t, 10*dt.Data{currentPart}.Vf-1300, 'b', 'linewidth', 1.5)
        hold on
        plot(t, (10*30)*ones(length(t),1)+1000, 'color', [0.8 0.8 0.8])
        hold on
        plot(t, 10*dt.Data{currentPart}.WallDist+1000, 'k', 'linewidth', 2)
        xlabel('Time (s)')
        axis([0 t(end) -1500 1500])
    end

end