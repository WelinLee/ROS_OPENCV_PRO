clc;
clear;
close all;

A=imread('../data/test.png');
imshow(A);
title('ԭͼ');
[m,n,channel] = size(A);
pause(1.5);
B=im2double(rgb2gray(A));
hold off;
imshow(B);
title('�Ҷ�ͼ');
C=im2bw(B,0.3);
pause(1.5);
hold off;
imshow(C);
title('��ֵ�����ͼ');
pause(1.5);

x_start_zero = zeros(1,m);
x_end_zero = zeros(1,m);
x_count_zero = zeros(1,m);

%% ����ÿһ�дӵڼ�������0
for i=1:m
    for j=1:n
        if C(i,j)==0
            x_start_zero(i) = j;
            break
        end
    end
end

for i=1:m
    tmp=0;
    for j=n:-1:1
        if C(i,j)==0
            x_end_zero(i) = j;
            break
        end
        tmp = tmp+1;
    end
end
%�켣
x_point = ones(1,m);
y_point = ones(1,m);
for i=1:m
    x_count_zero(i)=x_end_zero(i)-x_start_zero(i);
    x_point(i)=(x_start_zero(i)+x_end_zero(i))/2;
    y_point(i) = i;
end

%% �����ο���ʾ
hold on;
for i=1:m
    title('�켣ͼ');
    axis on;
   rect_box = [x_start_zero(i),i,x_count_zero(i),17];    % ���ο��С
   draw_tmp1 = rectangle('Position',rect_box,'LineWidth',3,'EdgeColor','g');
   num1=zeros(1,x_count_zero(i));
   num_tmp = [1,num1,1];
   xaxis_no = x_start_zero(i)+x_count_zero(i)+2;
   draw_tmp2=text(xaxis_no,i+1,strcat('(',num2str(x_count_zero(i)),',',num2str(x_point(i)),')'),'Color','r');
   plot(x_point(i), y_point(i),'b','LineWidth',5)
   pause(0.01)
   set(draw_tmp1,'visible','off');
   set(draw_tmp2,'visible','off');
end
