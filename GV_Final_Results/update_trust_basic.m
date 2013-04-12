function []=update_trust_basic()
global forword notforword a b wage trust data obdata observation;
global attacker;
observation=forword/(forword+notforword);
a=wage*a+observation;
b=wage*b+(1-observation);
%b=wage*b+(1-observation);

%a=wage*a+forword;
%b=(1-wage)*b+notforword;
forword=0;
notforword=0;
trust=(a+1)/(a+b+2);
%for intelligent attack
% if trust > 0.85
%     attacker =1;
%     elseif trust < 0.7
%     attacker=0;
%    end 
data=[ data; trust];
%obdata=[obdata; observation];

end