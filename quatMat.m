function quatmat = quatMat(q)
%%Input
%%q 1*4 The real part of quaternion
%%Output
%%quatmat 3*3 The rotation matrix represented by the real part of
%%quaternion
q0=q(1);q1=q(2);q2=q(3);q3=q(4);
quatmat(1,1)=2*q0^2+2*q1^2-1;
quatmat(1,2)=2*q1*q2-2*q0*q3;
quatmat(1,3)=2*q1*q3+2*q0*q2;
quatmat(2,1)=2*q1*q2+2*q0*q3;
quatmat(2,2)=2*q0^2+2*q2^2-1;
quatmat(2,3)=2*q2*q3-2*q0*q1;
quatmat(3,1)=2*q1*q3-2*q0*q2;
quatmat(3,2)=2*q2*q3+2*q0*q1;
quatmat(3,3)=2*q0^2+2*q3^2-1;
end

