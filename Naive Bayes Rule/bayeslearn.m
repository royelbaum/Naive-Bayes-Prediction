function [allpos,ppos,pneg] = bayeslearn(Xtrain, Ytrain)
[m,d]=size(Xtrain);
numOfpos_l=0;
for i=1:m
    if Ytrain(i)==1
        numOfpos_l=1+numOfpos_l;
    end
end
numOfneg_l=m-numOfpos_l;
for i=1:d
    numOfposx=0;
    numOfnegx=0;
    for j=1:m
        if Xtrain(j,i)==1 && Ytrain(j)==1
            numOfposx=numOfposx+1;
        end
        if Xtrain(j,i)==1 && Ytrain(j)==-1
            numOfnegx=numOfnegx+1;
        end
        
    end
    ppos(i)=numOfposx/numOfpos_l;
    pneg(i)=numOfnegx/numOfneg_l;
end
allpos=numOfpos_l/m;
end
