function patterns = GetPatterns(nbrOfPatterns,nbrOfBits,widthPattern)

patterns = zeros(nbrOfPatterns,nbrOfBits)-1;

% 0
patterns(1,14:17) = 1;
patterns(1,23:28) = 1;
for iRow = 4:13
  patterns(1,widthPattern*(iRow-1)+2:widthPattern*(iRow-1)+4) = 1;
  patterns(1,widthPattern*(iRow-1)+7:widthPattern*(iRow-1)+9) = 1;
end
patterns(1,133:138) = 1;
patterns(1,144:147) = 1;

% 1
for iRow = 1:16
  patterns(2,widthPattern*(iRow-1)+4:widthPattern*(iRow-1)+7) = 1;
end
%2
patterns(3,1:8) = 1;
patterns(3,11:18) = 1;
patterns(3,26:28) = 1;
patterns(3,36:38) = 1;
patterns(3,46:48) = 1;
patterns(3,56:58) = 1;
patterns(3,66:68) = 1;
patterns(3,71:78) = 1;
patterns(3,81:88) = 1;
patterns(3,91:93) = 1;
patterns(3,101:103) = 1;
patterns(3,111:113) = 1;
patterns(3,121:123) = 1;
patterns(3,131:133) = 1;
patterns(3,141:148) = 1;
patterns(3,151:158) = 1;
% 3
patterns(4,3:8) = 1;
patterns(4,13:19) = 1;
patterns(4,27:29) = 1;
patterns(4,37:39) = 1;
patterns(4,47:49) = 1;
patterns(4,57:59) = 1;
patterns(4,67:69) = 1;
patterns(4,75:78) = 1;
patterns(4,85:88) = 1;
patterns(4,97:99) = 1;
patterns(4,107:109) = 1;
patterns(4,117:119) = 1;
patterns(4,127:129) = 1;
patterns(4,137:139) = 1;
patterns(4,143:149) = 1;
patterns(4,153:158) = 1;
% 4
patterns(5,2:3) = 1;
patterns(5,12:13) = 1;
patterns(5,22:23) = 1;
patterns(5,32:33) = 1;
patterns(5,42:43) = 1;
patterns(5,52:53) = 1;
patterns(5,62:63) = 1;
patterns(5,72:79) = 1;
patterns(5,82:89) = 1;
for iRow = 1:16
  patterns(5,widthPattern*(iRow-1)+8:widthPattern*(iRow-1)+9) = 1;
end

end