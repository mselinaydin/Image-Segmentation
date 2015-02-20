function R = growRegion(I, imPath, xseed, yseed, tHold)

% q = growRegion('coast1.png', 2, 280, 0.08);
% coast1.png icin sadece denizi seciyor
%     I = imread(imPath);
    I = im2double(I);
    [x, y, z] = size(I);
    
    R = zeros(x, y);
    mean = I(xseed, yseed, :);
    rSize = 1;
    
    %her piksel icin 4 neighboruna bakicaz, thresholddan kucukse ve zaten o
    %regiona dahil degilse regiona alicaz. R binary image.
    % -1 0, 1 0, 0 1, 0 -1
    
    % recursive olmasi lazim.
    
    
    for i = 2: (x -1)
        for j = 2: (y -1)
%             X = [I(i, j, :) ; mean];
%             dist = pdist(X, 'euclidean');
            dist = sqrt((I(i, j, 1) - mean(1, 1, 1))^2 + (I(i, j, 2) - mean(1, 1, 2))^2 + (I(i, j, 3) - mean(1, 1, 3))^2);
            if(dist < tHold && R(i, j) == 0) % bu piksel regiona ait
                R(i, j) = 1;
                mean(1, 1, 1) = (mean(1, 1, 1) * rSize + I(i, j, 1)) / (rSize + 1);
                mean(1, 1, 2) = (mean(1, 1, 2) * rSize + I(i, j, 2)) / (rSize + 1);
                mean(1, 1, 3) = (mean(1, 1, 3) * rSize + I(i, j, 3)) / (rSize + 1);
                rSize = rSize + 1;
            end
            
            dist = sqrt((I(i -1, j, 1) - mean(1, 1, 1))^2 + (I(i -1, j, 2) - mean(1, 1, 2))^2 + (I(i -1, j, 3) - mean(1, 1, 3))^2);
            if(dist < tHold && R(i -1, j) == 0) % bu piksel regiona ait
                R(i -1, j) = 1;
                mean(1, 1, 1) = (mean(1, 1, 1) * rSize + I(i -1, j, 1)) / (rSize + 1);
                mean(1, 1, 2) = (mean(1, 1, 2) * rSize + I(i -1, j, 2)) / (rSize + 1);
                mean(1, 1, 3) = (mean(1, 1, 3) * rSize + I(i -1, j, 3)) / (rSize + 1);
                rSize = rSize + 1;
            end
            dist = sqrt((I(i +1, j, 1) - mean(1, 1, 1))^2 + (I(i +1, j, 2) - mean(1, 1, 2))^2 + (I(i +1, j, 3) - mean(1, 1, 3))^2);
            if(dist < tHold && R(i +1, j) == 0) % bu piksel regiona ait
                R(i +1, j) = 1;
                mean(1, 1, 1) = (mean(1, 1, 1) * rSize + I(i +1, j, 1)) / (rSize + 1);
                mean(1, 1, 2) = (mean(1, 1, 2) * rSize + I(i +1, j, 2)) / (rSize + 1);
                mean(1, 1, 3) = (mean(1, 1, 3) * rSize + I(i +1, j, 3)) / (rSize + 1);
                rSize = rSize + 1;
            end
            dist = sqrt((I(i, j -1, 1) - mean(1, 1, 1))^2 + (I(i, j -1, 2) - mean(1, 1, 2))^2 + (I(i, j -1, 3) - mean(1, 1, 3))^2);
            if(dist < tHold && R(i, j -1) == 0) % bu piksel regiona ait
                R(i, j -1) = 1;
                mean(1, 1, 1) = (mean(1, 1, 1) * rSize + I(i, j -1, 1)) / (rSize + 1);
                mean(1, 1, 2) = (mean(1, 1, 2) * rSize + I(i, j -1, 2)) / (rSize + 1);
                mean(1, 1, 3) = (mean(1, 1, 3) * rSize + I(i, j -1, 3)) / (rSize + 1);
                rSize = rSize + 1;
            end
            dist = sqrt((I(i, j +1, 1) - mean(1, 1, 1))^2 + (I(i, j +1, 2) - mean(1, 1, 2))^2 + (I(i, j +1, 3) - mean(1, 1, 3))^2);
            if(dist < tHold && R(i, j +1) == 0) % bu piksel regiona ait
                R(i, j +1) = 1;
                mean(1, 1, 1) = (mean(1, 1, 1) * rSize + I(i, j +1, 1)) / (rSize + 1);
                mean(1, 1, 2) = (mean(1, 1, 2) * rSize + I(i, j +1, 2)) / (rSize + 1);
                mean(1, 1, 3) = (mean(1, 1, 3) * rSize + I(i, j +1, 3)) / (rSize + 1);
                rSize = rSize + 1;
            end
        end
    end