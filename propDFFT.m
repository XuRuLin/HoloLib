function U = propDFFT(data, width_Length, height_Length, lambda, z)
%propagation - D-FFT approach(propDFFT) 菲涅尔传播-两次傅里叶计算法方法
%   U = propDFFT(A, LW, LH, lambda, z) 对衍射平面A进行菲涅尔传播，返回观察平面复振幅分布
%   A  - M×N的衍射平面矩阵
%   LW - 图像宽度，单位：米
%   LH - 图像高度，单位：米
%   lambda - 入射光波长，单位：米
%   z - 衍射平面到观察平面距离，单位：米
%
%   U - 返回平面复振幅分布
% 
%   Author Information
%   -----------------------
%   Author : rlxu
%   Update Date : 2019-10-15
%
%   Copyright 2019 Key Laboratory of ICSP Anhui University

[height_Pixel, width_Pixel] = size(data);
k = 2*pi / lambda;
kethi = linspace(-1./2./width_Length, 1./2./width_Length, width_Pixel).* width_Pixel;
nenta = linspace(-1./2./height_Length, 1./2./height_Length, height_Pixel).* height_Pixel;
[kethi, nenta] = meshgrid(kethi, nenta);
H = exp(1j*k*z .* (1-lambda.^2.*(kethi.^2 + nenta.^2)./2));
F = fft2(fftshift(data));
Fuf = F.*H;
U = ifft2(Fuf);

end

