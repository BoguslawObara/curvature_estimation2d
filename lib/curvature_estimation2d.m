function [r,k,cc] = curvature_estimation2d(c) 
%% curvature_estimation2d - 2d curvature estimation by osculating circle
%   
%   REFERENCE:
%       Simon Hermann and Reinhard Klette,
%       A Comparative Study on 2D Curvature Estimators,
%       International Conference on Computing: Theory and
%       Applications,584-589,2007
%       (Algorithm 2)
%
%       A. Lichius, A. B. Goryachev, M. D. Fricker, B. Obara, 
%       E. Castro-Longoria, N. D. Read, CDC-42 and RAC-1 regulate opposite 
%       chemotropisms in Neurospora crassa, 
%       Journal of Cell Science, 127, 9, 1953-1965, 2014
%
%   INPUT:
%       c     - contour as [y,x].
%
%   OUTPUT:
%       r     - radius,
%       k     - curvature = 1/r,
%       c     - circle center.
%
%   AUTHOR:
%       Boguslaw Obara

%% curve segmentation
s = curve_segmentation2d(c); 

%% curvature estimation
r = []; k = []; cc = [];
for i=1+1:size(s)-1
    ixL = s(i-1);
    ixC = s(i);
    ixR = s(i+1);
    pi_kb = c(ixL,:);
    pi_kf = c(ixR,:);
    pi_k  = c(ixC,:);
    [a1,b1,c1] = points_bisect_line_imp_2d(pi_k,pi_kb);
    [a2,b2,c2] = points_bisect_line_imp_2d(pi_k,pi_kf);
    [ival,center] = lines_imp_int_2d(a1,b1,c1,a2,b2,c2);
    if ival==1
       vector = pi_k-center; 
       radius = norm(vector);
       r = [r; radius];
       k = [k; 1/radius];
       cc = [cc; center];
    end
end

end