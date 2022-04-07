function OFFStim(win)
% Full Field Off Simulus - 50 ms 
screenid = max(Screen('Screens'));

white = WhiteIndex(screenid);
black = BlackIndex(screenid);
Screen('Fillrect', win, black);
Screen('Flip', win) ;

pause(.050);
Screen('Fillrect', win, white);
Screen('Flip', win);

end

