function newIm = edgeFilter(im, bin)

%bin maskta soldan sga ilerliyo ilk beyazi buluyo sonra sagdan sola
%ilerliyo
[x, y, z] = size(im);
newIm = im;

for i = 1: x
    for j = 1:y
        if(bin(i, j) == 1)
            for k = j: j+10
                newIm(i, k, 1) = 241;
                newIm(i, k, 2) = 247;
                newIm(i, k, 3) = 129;
            end
            break;
        end
    end
end

for i = x-1:-1: 1
    for j = y-1:-1: 1
        if(bin(i, j) == 1)
            for k = j: j+15
                newIm(i, k, 1) = 241;
                newIm(i, k, 2) = 247;
                newIm(i, k, 3) = 129;
            end
            break;
        end
    end
end