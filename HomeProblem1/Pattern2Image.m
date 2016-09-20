function [image] = Pattern2Image(pattern,width,height)

image = zeros(height,width);

for iRow = 1:height
  image(iRow,:) = pattern(width*(iRow-1)+1:width*(iRow-1)+width);
end

end