function [win, winRect] = CreateStimWindow(color)
% Make sure this is running on OpenGL Psychtoolbox:
AssertOpenGL;
% Create the stim window using Psychtoolbox-3
% Choose screen with maximum id - the secondary display on a dual-display
% setup for display:
screenid = max(Screen('Screens'));

white = WhiteIndex(screenid);
black = BlackIndex(screenid);

% Open a fullscreen onscreen window on that display, choose a background
% color of 128 = gray, i.e. 50% max intensity:
[win, winRect] = Screen('OpenWindow', screenid, color, [0,0,400,400]);


Screen('Flip', win) 
Screen('Fillrect', win, white)

end
