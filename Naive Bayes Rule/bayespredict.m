function Ypredict = bayespredict(allpos, ppos, pneg, Xtest)
[m,d]=size(Xtest);
allneg=1-allpos;
for i=1:m
    ypos=log(allpos);
    yneg=log(allneg);
    for j=1:d
        if Xtest(i,j)==1
            if ~isnan(ppos(j)) 
                ypos=ypos+log(ppos(j));
            end
            if ~isnan(pneg(j))
                yneg=yneg+log(pneg(j));
            end
            
        end
        if Xtest(i,j)==0
            if ~isnan(ppos(j))
                ypos=ypos+log((1-ppos(j)));
            end
            if ~isnan(pneg(j))
                yneg=yneg+log((1-pneg(j)));
            end
            
        end
        
    end
    if ypos>=yneg
        Ypredict(i,1)=1;
    else
        Ypredict(i,1)=-1;
    end
    
end

