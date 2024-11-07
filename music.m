f_do=261;
f_mi=329;
f_sol=392;
fd=8000;
dt=1/fd;
t=0:dt:1;
s_do=sin(2*pi * t * f_do);
s_mi=sin(2*pi * t * f_mi);
s_sol=sin(2*pi * t * f_sol);
sum=(s_do + s_mi + s_sol) / 3;
sound(sum, fd)