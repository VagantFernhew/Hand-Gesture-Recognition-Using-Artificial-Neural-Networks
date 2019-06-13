a1 = [X(1:end , 1:end),ones(size(X,1),1)];
zet_2 = Theta1*(a1)';
a2 = sigmoid(zet_2);
a2 = a2';
a2 = [a2(1:end,1:end) ones(size(a2,1),1)];
a2 = a2';
zet_3 = Theta2*a2;
a3 = sigmoid(zet_3);
h = a3;
% regularization term
reg_Theta1 = Theta1(1:end,2:end);
reg_Theta2 = Theta2(1:end,2:end);
s1 = sum(reg_Theta1.*reg_Theta1);
s2 = sum(reg_Theta2.*reg_Theta2);
s = sum(sum(s1) + sum(s2));
reg_term = (s*lambda)/(2*m);