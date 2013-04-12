% This program allows to compare basic, chen and GV model inorder to 
% Completed on September 8th time: 12:47 am
%
%find the pattern of attacker. 
%This is used for final results.
% scenario comments are provided. 
%based on start and end commands following situations can be done.

%Default is Always cooperative scenario
% attacker =1 inplies allways non-cooperative

%k values set indicates only few drops

%function []=trustmanagment(nodebehaviour)
clear all

tindex=1;
packetarrivaltime=1;
timearray=[];
obtimearray=[];
%figure1
%attacker_starttime=2000
%onoffinterval=1000;
%watchdogupdate=50;
%simulationtime=5000;

%figure2
attacker_starttime=1000
onoffinterval=1000;
watchdogupdate=50;
simulationtime=3000;

interval=1;
global forword notforword wage data attacker a b trust  obdata observation;
nodebehaviour=3;

wage=.98;

%update_trust();

%obtimearray=[obtimearra;0];
%obdata=[obdata;0];
for model=1:3
forword=0; 
notforword=0;
attacker=0;
a=1;
b=1;
data=[];
data=[data ;.5 ];
timearray=[];
timearray=[timearray ;0 ];
k=100;

for tindex=1:simulationtime
   
   %//for scenario on-off attacker -start
  %attacker=1;
   %//for scenario on-off attacker -end
    
 
  if tindex >=attacker_starttime && mod(tindex,onoffinterval)==0  
        
      if attacker== 1
           attacker = 0;
       else
          attacker =1;
       end
   end
  
  %//for scenario: fewdrops uncomment following -start
    
  
%     if tindex>=attacker_starttime && tindex < attacker_starttime+k
%        attacker=1;
%     else 
%         attacker=0;
%     end
   %//for scenario: fewdrops uncomment following -end
   
  % if tindex==2000 && nodebehaviour==3
  %    attacker=2;
  % end   
   %if tindex==1003 && nodebehaviour==3
    %  attacker=0;
   %end   
          
   udate_fwd_nfwd_model(); 
       % obtimearray=[obtimearra;tindex];
   %update_trust_GV_modf2();
   %update_trust_basic();
  if mod(tindex,watchdogupdate)==0 
      if model==1
      update_trust_basic();
      elseif model==2
      update_trust_chen();
      else
     update_trust_GV_modf3();
      
      end
   timearray=[timearray ;tindex ];
  end
   
    
        
end

        if model==1
            basic_model=data;
        elseif model==2
            chen_model=data;
        else 
             GV_model=data;
        end


        end

%data
%timearray
%axis([1 10 0 1])
%subplot(1,1,1);

%scatter(timearray,data,1);
plot(timearray,basic_model,'r:+')
hold all
plot(timearray,chen_model,'g:*')
hold all
plot(timearray,GV_model,'b:o')
xlabel('Time Window')
ylabel('Point of trust rating')
hleg = legend('Basic Model','ATSN','Proposed Model','Location','NorthEastOutside')
%axis([1 10 0 1])
%subplot(2,1,1);
%scatter(obtimearray,obdata,2);

%end