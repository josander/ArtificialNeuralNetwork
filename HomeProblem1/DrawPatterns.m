function [] = DrawPatterns(distortedPattern,width,height,distortionRate,outputPattern)

figure(1)
subplot(1,2,1)
image = Pattern2Image(distortedPattern,width,height);
imagesc(image)
axis off
text = sprintf('Distortion rate: %.2f',distortionRate);
title(text)
subplot(1,2,2)
image = Pattern2Image(outputPattern,width,height);
imagesc(image)
axis off
text = sprintf('Output');
title(text)
drawnow

end