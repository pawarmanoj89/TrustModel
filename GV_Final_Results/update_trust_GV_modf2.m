function []=update_trust_GV_modf2()
global forword notforword a b wage trust data obdata observation;
temp=forword+notforword;
if temp > 0
observation=forword/(forword+notforword);
else
    observation=0;
end
temp1=(a)/(a+b);
if(observation >= 0.5)
    To=1;
else 
    To=0;
end


if(temp1 >= 0.5)
Th=1;
else
Th=0;
end;
wage=0.98;
if((To==1 && Th==1) && (To==0 && Th==0) && (To==1 && Th==0))
a=wage*a+observation;
b=wage*b+(1-observation);
else
    if b>0
    gfactor = a/b;
    end
    if(temp1 > 0.7)
        k=0.9;
    else k=0.4;
    end
    a=b*(gfactor*k);
    a=wage*a+observation;
    b=wage*b+(1-observation);
end

forword=0;
notforword=0;
trust=(a+1)/(a+b+2);

data=[ data; trust];


end