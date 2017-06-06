function demodulatedBitArray8QAM = demodulator8QAM (x, y, BIT_NUMBER)

    demodulatedBitArray8QAM = zeros(BIT_NUMBER, 1);
    amplitude = 0.5;          % amplituda, pamietaj zmienic rowniez w 8qamchannel; programista plakal jak programowal
    
    point000 = [0.5*amplitude*cos(2*pi*0.625),0.5*amplitude*sin(2*pi*0.625)];
    point001 = [amplitude*cos(2*pi),amplitude*sin(2*pi)];
    point010 = [amplitude*cos(2*pi*0.75),amplitude*sin(2*pi*0.75)];
    point011 = [0.5*amplitude*cos(2*pi*0.625),0.5*amplitude*sin(2*pi*0.625)];
    point100 = [amplitude*cos(2*pi*0.5),amplitude*sin(2*pi*0.5)];
    point101 = [0.5*amplitude*cos(2*pi*0.875),0.5*amplitude*sin(2*pi*0.875)];
    point110 = [0.5*amplitude*cos(2*pi*0.375),0.5*amplitude*sin(2*pi*0.375)];
    point111 = [amplitude*cos(2*pi*0.25),amplitude*sin(2*pi*0.25)];
    
    for i = 1:BIT_NUMBER/3
        closestPoint = 0;
        pointArray = [x(i), y(i); point000(1), point000(2)];
        closestDistance = pdist(pointArray, 'euclidean');
        
        pointArray(2,1) = point001(1);
        pointArray(2,2) = point001(2);
        distance = pdist(pointArray, 'euclidean');
        if distance < closestDistance
            closestDistance = distance;
            closestPoint = 1;
        end
        pointArray(2,1) = point010(1);
        pointArray(2,2) = point010(2);
        distance = pdist(pointArray, 'euclidean');
        if distance < closestDistance
            closestDistance = distance;
            closestPoint = 2;
        end
        pointArray(2,1) = point011(1);
        pointArray(2,2) = point011(2);
        distance = pdist(pointArray, 'euclidean');
        if distance < closestDistance
            closestDistance = distance;
            closestPoint = 3;
        end
        pointArray(2,1) = point100(1);
        pointArray(2,2) = point100(2);
        distance = pdist(pointArray, 'euclidean');
        if distance < closestDistance
            closestDistance = distance;
            closestPoint = 4;
        end
        pointArray(2,1) = point101(1);
        pointArray(2,2) = point101(2);
        distance = pdist(pointArray, 'euclidean');
        if distance < closestDistance
            closestDistance = distance;
            closestPoint = 5;
        end
        pointArray(2,1) = point110(1);
        pointArray(2,2) = point110(2);
        distance = pdist(pointArray, 'euclidean');
        if distance < closestDistance
            closestDistance = distance;
            closestPoint = 6;
        end
        pointArray(2,1) = point111(1);
        pointArray(2,2) = point111(2);
        distance = pdist(pointArray, 'euclidean');
        if distance < closestDistance
            closestDistance = distance;
            closestPoint = 7;
        end
        
        if closestPoint == 0
            demodulatedBitArray8QAM((3*i)-2) = 0;
            demodulatedBitArray8QAM((3*i)-1) = 0;
            demodulatedBitArray8QAM(3*i) = 0;
        end
        if closestPoint == 1
            demodulatedBitArray8QAM((3*i)-2) = 0;
            demodulatedBitArray8QAM((3*i)-1) = 0;
            demodulatedBitArray8QAM(3*i) = 1;
        end
        if closestPoint == 2
            demodulatedBitArray8QAM((3*i)-2) = 0;
            demodulatedBitArray8QAM((3*i)-1) = 1;
            demodulatedBitArray8QAM(3*i) = 0;
        end
        if closestPoint == 3
            demodulatedBitArray8QAM((3*i)-2) = 0;
            demodulatedBitArray8QAM((3*i)-1) = 1;
            demodulatedBitArray8QAM(3*i) = 1;
        end
        if closestPoint == 4
            demodulatedBitArray8QAM((3*i)-2) = 1;
            demodulatedBitArray8QAM((3*i)-1) = 0;
            demodulatedBitArray8QAM(3*i) = 0;
        end
        if closestPoint == 5
            demodulatedBitArray8QAM((3*i)-2) = 1;
            demodulatedBitArray8QAM((3*i)-1) = 0;
            demodulatedBitArray8QAM(3*i) = 1;
        end
        if closestPoint == 6
            demodulatedBitArray8QAM((3*i)-2) = 1;
            demodulatedBitArray8QAM((3*i)-1) = 1;
            demodulatedBitArray8QAM(3*i) = 0;
        end
        if closestPoint == 7
            demodulatedBitArray8QAM((3*i)-2) = 1;
            demodulatedBitArray8QAM((3*i)-1) = 1;
            demodulatedBitArray8QAM(3*i) = 1;
        end
    end
end