function []=update_trust_GV_modf2_V2()
global forword notforword a b wage trust data obdata observation;
observation=forword/(forword+notforword);
temp=a/(a+b);

if(observation < 0.7 && temp > 0.7)
   wage1=0.98;
   wage2=0.98;
elseif (observation < 0.7 && temp < 0.5)
  wage1=0.1;
  wage2=0.98;
elseif(observation > 0.5 && temp < 0.4)
  wage1=0.1;
  wage2=0.98;
else
   wage1=0.98;
   wage2=0.98; 
end
a=wage1*a+observation;
b=wage2*b+(1-observation);

forword=0;
notforword=0;
trust=(a+1)/(a+b+2);

data=[ data; trust];


end