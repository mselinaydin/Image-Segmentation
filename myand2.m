function newIm = myand2(im, binIm)
    newIm = im;
    [x, y, z] = size(im);
    
    for i = 1: x
        for j = 1: y
            if(binIm(i, j) == 1)
                newIm(i, j, 1) = 241;
                newIm(i, j, 2) = 247;
                newIm(i, j, 3) = 129;
            else
                newIm(i, j, 1) = 241;
                newIm(i, j, 2) = 100;
                newIm(i, j, 3) = 100;
            end
        end
    end