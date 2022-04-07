function StimControl
StimControlPanel = figure('Color','w');
myWin = CreateStimWindow();
%StimPanel = uifigure;
OFFStimBut = uicontrol(gcf,'Style', 'push', ...
                           'String', 'OFF Stim', ...
                           'Position', [20 170 80 30], ...
                           'CallBack', @OffStimPush);


batteryGratingButton = uicontrol(gcf,'Style', 'push', ...
                           'String', 'Pseudo Random Grating', ...
                           'Position', [20 200 200 30], ...
                           'CallBack', @randoGrating);



userGratingButton = uicontrol(gcf,'Style', 'push', ...
                           'String', 'User Angle', ...
                           'Position', [20 60 100 30], ...
                           'CallBack', @userGrating);

CloseWinButton = uicontrol(gcf,'Style', 'push', ...
                           'String', 'Close Stim Window', ...
                           'BackgroundColor', 'red', ...
                           'Position', [20 10 200 30], ...
                           'CallBack', @closeStimWindow);

% Java Slider to pick grating angle 
userAngel = javaObjectEDT(javax.swing.JSlider(0,360,1))
userAngel.setBackground(java.awt.Color.white);  % Java setter-method notation
userAngel.setPaintTicks(true);
set(userAngel, 'MinorTickSpacing',15, 'MajorTickSpacing',90, 'SnapToTicks',true, 'PaintLabels',true);  % HG set notation
[hSlider5, hContainer5] = javacomponent(userAngel, [120 60 250 45], StimControlPanel);


function OffStimPush(source,event)
    OFFStim(myWin);
end

function userGrating(source,event)
    ang = userAngel.getValue
    GenGrating(myWin, ang, 2, .034, 450, 450)
end

function randoGrating(source,event)
    pseudoRandGrating(myWin)
end

function closeStimWindow(source,event)
    sca;
end

end
