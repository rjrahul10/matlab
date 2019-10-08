clc;
clear;
close all;
x = [1 1 0 0 1 1 0 1];
xsize=length(x);
n=100;
t = 0:1:799;
subplot(7,1,1);
y=zeros(1, n);
for i=0:xsize-1
    if x(i+1)==1
        y(i*n+1:(i+1)*n)=1;
    end
end
plot(t,y);
title('Unipolar');
subplot(7,1,2);
y=zeros(1, n);
for i=0:xsize-1
    if x(i+1)==1
        y(i*n+1:(i+1)*n)=-1;
    elseif x(i+1)==0
    y(i*n+1:(i+1)*n)=1;
    end
end
plot(t,y);
title('Polar: NRZ-L');
subplot(7,1,3);
y=ones(1, n);
p=1;
for i=1:xsize-1
    if x(i+1)==1
        if p==1
            p=-1;
        elseif p==-1
            p=1;
        end
        y(i*n+1:(i+1)*n)=p;
    elseif x(i+1)==0
        y(i*n+1:(i+1)*n)=p;
    end
end
plot(t,y);
title('Polar: NRZ-I');
subplot(7,1,4);
y=zeros(1, n);
for i=0:xsize-1
    if x(i+1)==1
        y(i*n+1:(i+0.5)*n)=-1;
        y((i+0.5)*n+1:(i+1)*n)=1;
    elseif x(i+1)==0
        y(i*n+1:(i+0.5)*n)=1;
        y((i+0.5)*n+1:(i+1)*n)=-1;
    end
end
plot(t,y);
title('Polar: Manchester');
subplot(7,1,5);
y=ones(1, n);
p=1;
i=0;
y(i*n+1:(i+0.5)*n)=p;
y((i+0.5)*n+1:(i+1)*n)=-p;
for i=1:xsize-1
    if x(i+1)==1
        y(i*n+1:(i+0.5)*n)=-p;
        y((i+0.5)*n+1:(i+1)*n)=p;
        p=-p;
    elseif x(i+1)==0
        y(i*n+1:(i+0.5)*n)=p;
        y((i+0.5)*n+1:(i+1)*n)=-p;
    end
end
plot(t,y);
title('Polar: Differential Manchester');
subplot(7,1,6);
y=ones(1, n);
p=1;
for i=1:xsize-1
    if x(i+1)==1
        if p==1
            p=-1;
        elseif p==-1
            p=1;
        end
        y(i*n+1:(i+1)*n)=p;
    elseif x(i+1)==0
        y(i*n+1:(i+1)*n)=0;
    end
end
plot(t,y);
title('Bipolar: AMI');
subplot(7,1,7);
y=ones(1, n);
p=-1;
for i=0:xsize-1
    if x(i+1)==0
        if p==1
            p=-1;
        elseif p==-1
            p=1;
        end
        y(i*n+1:(i+1)*n)=p;
    elseif x(i+1)==1
        y(i*n+1:(i+1)*n)=0;
    end
end
plot(t,y);
title('Bipolar: Pseudoternary');
