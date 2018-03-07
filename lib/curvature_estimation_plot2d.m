function curvature_estimation_plot2d(c,radius,center)
for i=1:length(radius)
    plot(center(i,2),center(i,1),'r.'); hold on;
    theta = linspace(0,2*pi,1000);
    rho = ones(1,1000)*radius(i);
    [x,y] = pol2cart(theta,rho);
    x = x + center(i,2);
    y = y + center(i,1);
    plot(x,y,'r-'); hold on;
end
plot(c(:,2),c(:,1),'b-','LineWidth',2); hold on;
end