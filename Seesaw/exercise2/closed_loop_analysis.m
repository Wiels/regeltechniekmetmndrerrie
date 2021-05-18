cl_sys = feedback(sys,1);
figure;
pzmap(cl_sys);
figure;
step(cl_sys);
figure;
impulse(cl_sys);