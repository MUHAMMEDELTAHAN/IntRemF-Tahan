clear;close;clc;
% % %these are the square border around hurgada200*200 centered at hurgada
long_left=32.8006008;
long_right=34.824392;
lat_lower=26.270891;
lat_upper=28.088842;
dir_list=dir('*.mat');
for k=1:length(dir_list);
% % %these are the square border around hurgada200*200 centered at hurgada
long_left=32.8006008;
long_right=34.824392;
lat_lower=26.270891;
lat_upper=28.088842;
    dir_list=dir('*.mat');
    FileName=dir_list(k).name;
    load(FileName);
    figure(1)
    subplot(2,2,k)
    h=worldmap([lat_lower lat_upper],[long_left long_right]);
    hg=surfm(lat,long,avg);
    gridm on
    getm(h,'MapProjection')
    land = shaperead('landareas.shp', 'UseGeoCoords', true);
    geoshow([land.Lat],[land.Lon],'Color','black');
    geoshow('worldlakes.shp', 'FaceColor', 'cyan');
    geoshow('worldrivers.shp', 'Color', 'blue')
    load D:\Clean_air_project\MODIS\script\worldlo.mat;
    a=POline(1);
    latg=a.lat;
    longg=a.long;
    h=plotm(latg,longg,'k-')
    caxis([0 0.8])
    colorbar('ver')
    set(h,'linewidth',1)
    if k==1
        title('Hurgada - DJF - 12 Years 2003 - 2014','fontsize',10);
    end
    if k==2
        title('Hurgada - JJA - 12 Years 2003 - 2014','fontsize',10);
    end
    if k==3
        title('Hurgada - MAM - 12 Years 2003 - 2014','fontsize',10);
    end
    if k==4
        title('Hurgada - SON - 12 Years 2003 - 2014','fontsize',10);
    end
    clear;
    
    
end
