function feats = getfeats(x,winsize,wininc,datawin,dispstatus)
	if nargin < 5
          if nargin < 4
       	  if nargin < 3
       	  	 if nargin < 2
       	  	 	winsize = size(x,1);
       	  	 end
       	  	 wininc = winsize;
       	  end
       	  	datawin = ones(winsize,1);
           end
       	dispstatus = 0;
	end
	aiv = getiavfeat(x,winsize,wininc,datawin,dispstatus);
	mav = getmavfeat(x,winsize,wininc,datawin,dispstatus);
	rms = getrmsfeat(x,winsize,wininc,datawin,dispstatus);
	varr = getvarfeat(x,winsize,wininc,datawin,dispstatus);
	wl = getwlfeat(x,winsize,wininc,datawin,dispstatus);
	feats = [aiv;mav;rms;varr;wl;];
end