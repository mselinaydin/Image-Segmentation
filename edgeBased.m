function newIm = edgeBased(imPath, yachtOrSea, bin)
    im = imread(imPath);
    cutIm = myand3(im, bin);
    [x, y, z] = size(im);
    grayIm = rgb2gray(cutIm);
    edgeIm = edge(grayIm, 'sobel');

    if(yachtOrSea == 1) % yat segment
        if (strcmp(imPath, 'coast1.PNG'))
            se = strel('line', 2, 0);
            q =imdilate(edgeIm, se);
            bw2 = imfill(q, 'holes');
            w =imerode(bw2, se);
            w =imerode(w, se);
            w =imerode(w, se);
            w =imdilate(w, se);
            w =imdilate(w, se);
            
            % burada yatlari seciyor ama hala kiyidaki seyler de var.
        end
        if (strcmp(imPath, 'coast2.PNG'))
            se = strel('line', 5, 135);
            z = imdilate(edgeIm, se);
            c = imerode(z, se);
            w = imfill(c, 'holes');
        end
        
        
        newIm = im;
        for i = 1:x
            for j = 1:y
                if(w(i, j) == 1)
                    newIm(i, j, 1) = 241;
                    newIm(i, j, 2) = 247;
                    newIm(i, j, 3) = 129;
                end
            end
        end
        
    else %sea segment

        a = im2bw(im);

        if (strcmp(imPath, 'coast1.PNG'))
            b = edge(edgeIm, 'sobel');
            se = strel('line', 5, 45);
            c = imdilate(b, se);
            se = strel('line', 5, 135);
            d = imdilate(c, se);
            e = imfill(d, 'holes');
            fld = imfill(e, 'holes');
            fed = edge(fld, 'sobel');
            %fed in icinde teknelerle birlikte kiyinin silueti var
            newIm = edgeFilter(im, fed);
        end
        if (strcmp(imPath, 'coast2.PNG'))
            se = strel('line', 3, 45);
            p = imdilate(edgeIm, se);
            newIm = edgeFilter(im, p);
        end

        
    end