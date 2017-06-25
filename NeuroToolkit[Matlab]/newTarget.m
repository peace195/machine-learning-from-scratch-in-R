load('InputTarget.mat');
InputTarget(InputTarget == 0) = 10;
newTarget = zeros(42000,10);
for i = 1:42000
   newTarget(i, InputTarget(i)) = 1; 
end

save newTarget;