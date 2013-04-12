function []=update_trust_GV_modf3()
global forword notforword a b wage trust data obdata observation attacker;
temp=forword+notforword;
if temp > 0
observation=forword/(forword+notforword);
else
    observation=0;
end
k=1;
temp1=a/a+b;
if observation < 0.5 
k=k*2;
a=a/k;
if a < 0.1
    k=1;
end
end

wage=0.98;
a=wage*a+observation;
b=wage*b+(1-observation);

forword=0;
notforword=0;
trust=(a+1)/(a+b+2);

% %setting attacker based on trust component
%    if trust > 0.9
%     attacker =1;
%   elseif trust < 0.7
%     attacker=0;
%    end 
data=[ data; trust];


end