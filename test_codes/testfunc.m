function testfunc(myvar)

%=========================================
% when this function is called without input parameter
% the function itself takes 10 as parameter value.
%============================================

if ~exist('myvar', 'var') || isempty(myvar)
    fprintf('myvar was not provided, hence it is created by testfunc');
    myvar = 10;
end
  myvar

end