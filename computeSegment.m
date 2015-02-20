function newIm = computeSegment(imPath, yachtOrSea, edOrReg)
    im = imread(imPath);
    a = im2bw(im);
    newIm = im;
    
    if (strcmp(imPath, 'coast1.PNG'))
        
        %find the biggest component
        cc = bwconncomp(~a);
        n = cellfun(@numel, cc.PixelIdxList);
        [big, idx] = max(n);
        b = zeros(887, 995);
        b(cc.PixelIdxList{idx}) = 1;
        b = ~b; % b tamamen karalar ve yatlar.
        
		se = strel('disk', 20);
		t = imerode(b, se);
		t = imdilate(t, se); % t tamamen karalar. yatlari yok ettik
        t = ~t; % sadece deniz
        
        if(edOrReg == 1) %edge
            newIm = edgeBased(imPath, yachtOrSea, t);
        elseif(edOrReg == 2) %region
            newIm = regionBased(imPath, yachtOrSea, t);
        end
    end
    if (strcmp(imPath, 'coast2.PNG'))
        
        cc = bwconncomp(~a);
		n = cellfun(@numel, cc.PixelIdxList);
		[big, idx] = max(n);
		b = zeros(959, 1445);
		b(cc.PixelIdxList{idx}) = 1;
		b = ~b;
        
		se = strel('disk', 20);
		t = imerode(b, se);
		t = imdilate(t, se);
        t = ~t; % sadece deniz
        
        
        if(edOrReg == 1) %edge
            newIm = edgeBased(imPath, yachtOrSea, t);
        elseif(edOrReg == 2) %region
            newIm = regionBased(imPath, yachtOrSea, t);
        end
    end
