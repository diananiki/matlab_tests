m = 400;
c = 100;
k = 200;
A = [0 1; -k/m -c/m];
B = [0 0; k/m c/m];
C = [1 0];
D = [0 0];
sys = ss(A, B, C, D);
bode(sys)