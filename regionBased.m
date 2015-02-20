function newIm = regionBased(imPath, yachtOrSea, bin)
    im = imread(imPath);
    cutIm = myand3(im, bin);
    
    if(yachtOrSea == 1) % segment yachts
        
        if (strcmp(imPath, 'coast1.PNG'))
            q = growRegion(cutIm, 'coast1.PNG', 188, 425, 0.07);
        else %coast 2 yatlari
            q = growRegion(cutIm, 'coast2.PNG', 380, 635, 0.05);
        end
        [x, y, z] = size(im);
        newIm = im;
        for i = 1:x
            for j = 1:y
                if(q(i, j) == 1)
                    newIm(i, j, 1) = 241;
                    newIm(i, j, 2) = 247;
                    newIm(i, j, 3) = 129;
                end
            end
        end
            
    else 
        
         if (strcmp(imPath, 'coast1.PNG'))
            q = growRegion(cutIm, 'coast1.PNG', 2, 280, 0.1);
            newIm = myand2(im, q);
        else %coast 2 denizi dagi
            w = growRegion(cutIm, 'coast2.PNG', 322, 973, 0.2);
            newIm = myand2(im, w);
            
            q = growRegion(cutIm, 'coast2.PNG', 380, 635, 0.05);
            [x, y, z] = size(im);
            for i = 1:x
                for j = 1:y
                    if(q(i, j) == 1)
                        newIm(i, j, 1) = 241;
                        newIm(i, j, 2) = 247;
                        newIm(i, j, 3) = 129;
                    end
                end
            end
        end
    end