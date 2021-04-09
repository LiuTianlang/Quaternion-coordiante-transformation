function J = Jmat(q,pt)
%%Input
%%q 1*4 The real part of quaternion
%%pt 3*1 The coordinate of a point One transformed point
%%Output
%% J 3*4, The Jacobian matrix
q0=q(1);q1=q(2);q2=q(3);q3=q(4);
x=pt(1);y=pt(2);z=pt(3);
J=zeros(3,4);
J(1,1)=4*q0*x-2*q3*y+2*q2*z;
J(1,2)=4*q1*x+2*q2*y+2*q1*z;
J(1,3)=2*q1*y+2*q0*z;
J(1,4)=-2*q0*y+2*q1*z;
J(2,1)=2*q3*x+4*q0*y-2*q1*z;
J(2,2)=2*q2*x-2*q0*z;
J(2,3)=2*q1*x+4*q2*y+2*q3*z;
J(2,4)=2*q0*x+2*q2*z;
J(3,1)=-2*q2*x+2*q1*y+4*q0*z;
J(3,2)=2*q3*x+2*q0*y;
J(3,3)=-2*q0*x+2*q3*y;
J(3,4)=2*q1*x+2*q2*y+4*q3*z;
end

