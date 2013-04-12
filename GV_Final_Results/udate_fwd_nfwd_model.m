function []=udate_fwd_nfwd_model()
global forword notforword attacker;
            if(attacker==1)
                notforword=notforword+1;
            elseif(attacker==0)
                forword=forword+1;
            else
                forword=0;
                notforword=0;
            end
                
  end 
 