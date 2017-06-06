function [color8QAM] = getColorsForQAM (BIT_NUMBER, bitArray)

color8QAM = zeros(floor(BIT_NUMBER/3),1);

    for i = 1:(BIT_NUMBER/3)
        if bitArray(3*i) == 0
            if bitArray((3*i)-1) == 0
                if bitArray((3*i)-2) == 0
                    color8QAM(i) = 1;
                end
                if bitArray((3*i)-2) == 1
                    color8QAM(i) = 2;
                end
            end 
            if bitArray((3*i)-1) == 1
                if bitArray((3*i)-2) == 0
                    color8QAM(i) = 3;
                end
                if bitArray((3*i)-2) == 1
                    color8QAM(i) = 4;
                end
            end
        end
        if bitArray(3*i) == 1
            if bitArray((3*i)-1) == 0
                if bitArray((3*i)-2) == 0
                    color8QAM(i) = 5;             
                end
                if bitArray((3*i)-2) == 1
                    color8QAM(i) = 6;
                end
            end 
            if bitArray((3*i)-1) == 1
                if bitArray((3*i)-2) == 0
                    color8QAM(i) = 7;
                end
                if bitArray((3*i)-2) == 1
                    color8QAM(i) = 8;
                end
            end
        end
    end
end