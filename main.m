%%An algorithm based on LMA(Levenberg–Marquardt algorithm) to calculate
%%euler angle between two sets of conjugate points
%%Made by Tianlang Liu
%%All rights reserved 2021/4/9

clear all;
%%Points number

ptReq = 'Please enter the numer of point for test ';
ptsNum = input(ptReq);
points=rand(3,ptsNum);
%%Euler angle 
eulReq = 'Please enter Euler angle for test (1*3 matrix) ';
eul=input(eulReq);
rotm = eul2rotm(eul);
%%Transform and add noise
pointsT=rotm*points+0.01*rand(3,20);
%Initial value
J=[];
delta=[];
q=[1 0 0 0]';

lamdaReq = 'Please enter lamda in LMA ';
lamda=input(lamdaReq);
while(1)
    R = quatMat(q);
    %%Build J and delta for each iteration
    for i=1:length(points)
        tempJ=Jmat(q,points(:,i));
        J=cat(1,J,tempJ);
        deltaTemp=deltaMat(R,pointsT(:,i),points(:,i));
        delta=cat(1,delta,deltaTemp);
    end
    %%LMA
    qnew=q+(J'*J+10^-lamda*eye(length(q)))^-1*J'*delta;
    qdiff=norm(qnew-q)
    q=qnew;
    if(qdiff<10^-6)
        break;
    end
    J=[];
delta=[];
end
 eulmEst = rotm2eul(quat2rotm(qnew'));
 disp('Compare the input Euler angle and estimated Euler angle (radian) ');
 disp('Input');
 disp(eul);
 disp('Estimated');
 disp(eulmEst);
 