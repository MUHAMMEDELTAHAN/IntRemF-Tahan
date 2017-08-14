clear;clc
dir_list=dir('*.mat'); 

for k=1:length(dir_list);
    FileName=dir_list(k).name;
    load(FileName,'average_20','average_50','average_100','average_150','average')
    vect_20(k)=average_20;
    vect_50(k)=average_50;
    vect_100(k)=average_100;
    vect_150(k)=average_150;
    vect_200(k)=average;
    %yy(k)=days;
    %yy=days;
end
 tt=length(vect_20);
 yyy=1:1:tt;
 
 save('Hurgada_vector_averge','yyy','vect_200','vect_20','vect_50','vect_100','vect_150','tt');
% 
figure

subplot(5,1,1)
yyy1=1:365:4383;
plot(yyy,vect_20)
set(gca,'XTick',1:365:4383-365)
set(gca,'XMinorTick','on')
title('AOD Time Series over Hurgada 20*20')
set(gca,'XTickLabel',{'2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014'})
ylabel('AOD')
grid on
ylim([0 3])
subplot(5,1,2)
yyy1=1:365:4383;
plot(yyy,vect_50)
set(gca,'XTick',1:365:4383-365)
set(gca,'XMinorTick','on')
title('AOD Time Series over Hurgada 50*50')
set(gca,'XTickLabel',{'2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014'})
ylabel('AOD')
grid on
ylim([0 3])
subplot(5,1,3)
yyy1=1:365:4383;
plot(yyy,vect_100)
set(gca,'XTick',1:365:4383-365)
set(gca,'XMinorTick','on')
title('AOD Time Series over Hurgada 100*100')
set(gca,'XTickLabel',{'2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014'})
ylabel('AOD')
grid on
ylim([0 3])
subplot(5,1,4)
yyy1=1:365:4383;
plot(yyy,vect_150)
set(gca,'XTick',1:365:4383-365)
set(gca,'XMinorTick','on')
title('AOD Time Series over Hurgada 150*150')
set(gca,'XTickLabel',{'2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014'})
ylabel('AOD')
grid on
ylim([0 3])
subplot(5,1,5)
yyy1=1:365:4383;
plot(yyy,vect_200)
set(gca,'XTick',1:365:4383-365)
set(gca,'XMinorTick','on')
title('AOD Time Series over Hurgada 200*200')
set(gca,'XTickLabel',{'2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014'})
xlabel('years')
ylabel('AOD')
grid on
ylim([0 3])
% xlabel('period from 2002 - 2013')
% ylabel('Deep blue Aerosol Optical Depth 550 Land')