cl_sys = feedback(sys,K);
figure;
pzmap(cl_sys);
figure;
step(cl_sys);
figure;
impulse(cl_sys);