function delta=deltaMat(R,ptLeft,ptRight)
%%Input
%%R 3*3 Rotation matrix represented by quaternion
%%ptLeft 3*1 One transformed point
%%ptRight 3*1 One original points
%%Output
%% delta 3*1 The inconsistency between one R*original point and one transformed point
delta=ptLeft-R*ptRight;