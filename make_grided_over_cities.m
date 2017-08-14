%......this script to convert the data to grided data

clear
clc
%
% %these are the square border around cairo 200*200 centered at alex
% long_left=28.865253;
% long_right=30.965506;
% lat_lower=30.299875;
% lat_upper=32.108689;
%
% %these are the square border around cairo 200*200 centered at assuit
% long_left=30.181075;
% long_right=32.195358;
% lat_lower=26.277275;
% lat_upper=28.078358;

% %.....................aswan...........
% long_left=31.879119;
% long_right=33.846781;
% lat_lower=23.147894;
% lat_upper=24.957817;
%

% % these are the square border around cairo 200*200 centered at cairo
% %
% long_left=30.676111;
% long_right=32.274503;
% lat_lower=29.129733;
% lat_upper=30.949689;

% % % % %these are the square border around cairo 200*200 centered at hurgada
% long_left=32.8006006;
% long_right=34.824394;
% lat_lower=26.270889;
% lat_upper=28.088844;

%these are the square border around cairo 20*20 centered at EGYPT

long_left=23.7388;
long_right= 36.2612;

lat_lower= 21.5824;
lat_upper= 32.3057 ;


dir_list=dir('*.mat');

for k=1:length(dir_list) ;
    try
        % %these are the square border around cairo 200*200 centered at alex
        % long_left=28.865253;
        % long_right=30.965506;
        % lat_lower=30.299875;
        % lat_upper=32.108689;
        %
        %         % %these are the square border around cairo 200*200 centered at assuit
        %         long_left=30.181075;
        %         long_right=32.195358;
        %         lat_lower=26.277275;
        %         lat_upper=28.078358;
        %
        % %.....................aswan...........
        % long_left=31.879119;
        % long_right=33.846781;
        % lat_lower=23.147894;
        % lat_upper=24.957817;
        %
        
        % % these are the square border around cairo 200*200 centered at cairo
        % %
        % long_left=30.676111;
        % long_right=32.274503;
        % lat_lower=29.129733;
        % lat_upper=30.949689;
        
        %         % % %these are the square border around cairo 200*200 centered at hurgada
        %         long_left=32.8006006;
        %         long_right=34.824394;
        %         lat_lower=26.270889;
        %         lat_upper=28.088844;
long_left=23.7388;
long_right= 36.2612;

lat_lower= 21.5824;
lat_upper= 32.3057 ;

        dir_list=dir('*.mat');
        
        FileName=dir_list(k).name;
        load(FileName,'long_cairo','lat_cairo','AOD_cairo')
        lat1_cairo=double(lat_cairo);
        long1_cairo=double(long_cairo);
        combined_cairo_1=double(AOD_cairo);
        combined_cairo_1= repla_grid(combined_cairo_1);
        number_of_points_xref=119;
        number_of_points_yref=119;
        xi=linspace(lat_lower,lat_upper,number_of_points_xref);
        yi=linspace(long_left,long_right,number_of_points_yref);
        [lat , long]=meshgrid(xi,yi);
        ZI_near=griddata(lat1_cairo,long1_cairo,combined_cairo_1,lat,long,'nearest');
        %     ZI_lin=griddata(lat1_cairo,long1_cairo,AOD1_cairo,XI,YI,'linear');
        %     ZI_nat=griddata(lat1_cairo,long1_cairo,AOD1_cairo,XI,YI,'natural');
        %     ZI_cu=griddata(lat1_cairo,long1_cairo,AOD1_cairo,XI,YI,'cubic');
        %     ZI_v4=griddata(lat1_cairo,long1_cairo,AOD1_cairo,XI,YI,'v4');
        % ,'ZI_lin','ZI_nat','ZI_cu','ZI_v4'
        
    catch
        %disp(FileName);
    end
    save(FileName,'long','lat','ZI_near','-append')
    clear,close
end