function newIm = myand3(oldIm, binMask)
    [x, y, z] = size(oldIm);
    newIm = oldIm;
    for i = 1: x
        for j = 1: y
            if(binMask(i, j) == 0)
                newIm(i, j, :) = 0;
            end
        end
    end
    