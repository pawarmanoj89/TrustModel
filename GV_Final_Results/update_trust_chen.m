function []=update_trust_chen()
global forword notforword a b wage trust data obdata observation;
global attacker;
if (forword+notforword>0)
observation=forword/(forword+notforword);
else
 observation=0;
end
temp1=(a+1)/(a+b+2);
    wage=0.1;
    a=wage*a+observation;
    b=(1-wage)*b+(1-observation);
    
forword=0;
notforword=0;
trust=(a+1)/(a+b+2);
%for intelligent attack
% temp1=(a+1)/(a+b+2);
% if temp1 > 0.6 
%      attacker =1;
%  elseif temp1 < 0.5
%      attacker=0;
%  end
% temp1;
data=[ data; trust];
%obdata=[obdata; observation];

end