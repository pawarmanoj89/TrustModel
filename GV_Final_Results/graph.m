x = -pi:.1:pi;
axis([0 80 -5 5])

plot(sin(x),'k:+')

hold all
plot(cos(x),'k:*')
hold all
plot(log(abs(x)),'k:o')

xlabel('X axis')
ylabel('Y axis')
hleg = legend('First','Second','Third','Location','NorthEastOutside')