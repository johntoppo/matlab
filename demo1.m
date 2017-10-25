i = imread('john.jpg');
I=rgb2gray(i);
bw=im2bw(I);
figure;
imshow(bw);



[n1 n2]=size(bw);
r=floor(n1/10);
c=floor(n2/10);
x1=1;x2=r;
s=r*c;
for i=1:10
    y1=1;y2=c;
     for j=1:10
         if(y2<=c | y2>=9*c) | (x1==1 | x2==r*10)
             loc=find(bw(x1:x2, y1:y2)==0);
             [o p] =size(loc);
             pr=o*100/s;
             if pr<=100
                 bw(x1:x2,y1:y2)=0;
                 r1=x1; r=x2;s1=y1;s2=y2;
                 pr1=0;
             end
             imshow(bw);
         end
         y=y1+c;
         y2=y2+c;
     end
         x1=x1+r;
         x2=x2+r;
     end
     figure, imshow(bw);
     
     
     L=bwlable(bw,8);
     BB=regionprops(L,'bouningbox');
     BB1=struct2cell(BB);
     [s1 s2]=size(BB2);
     mx=0;
     for k=3:4 : s2-1
         p=BB2(1,k)*BB2(1,k+1);
         if p>mx &(BB2(1,k)/BB2(1,k+1))<1.8
             mx=p;
             y=k;
         end
     end
     figure, imshow(I);
     hold on;
                 
rectangle('position',[BB2(1,j-2),BB2(1,j-1),BB2(i,j),BB2(1, j+1)],'EdgeColor','r')


