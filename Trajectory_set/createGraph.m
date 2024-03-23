fundtion createGraph(i,f,tf,S)

sizeS = Size(S);

plot(i(1),i(2),i(3),'x');
hold on;
plot(f(1),f(2),f(3),'X');
hold on;

Traj = zeros([10 3]);

for n = 1:1:sizeS(1)
    for t = 1:(tf/200):(tf + 1)
        Traj(t,1) = f(1) + (i(1)-f(1))/(1 + (t/S(n,2))^S(n,1));
        Traj(t,2) = f(2) + (i(2)-f(2))/(1 + (t/S(n,4))^S(n,3));
        Traj(t,3) = f(3) + (i(3)-f(3))/(1 + (t/S(n,6))^S(n,5));
    end
    plot(Traj(:,1),Traj(:,2),Traj(:,3),'Color','g');
    hold on
end

plot(W(:,1),W(:,2),W(:,3),W(:,4),'Color','r','LineWidth',3);
hold off