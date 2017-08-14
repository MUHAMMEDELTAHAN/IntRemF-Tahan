clear
clc

%






% % %these are the square border around hurgada200*200 centered at Cairo
long_left=30.676111;
long_right=32.274503;
lat_lower=29.129733;
lat_upper=30.949689;

% % %these are the square border around hurgada150*150 centered at Cairo
long_left_150=30.461092;
long_right_150=32.016258;
lat_lower_150=29.368631;
lat_upper_150=30.719644;

% % %these are the square border around hurgada100*100 centered at Cairo

long_left_100=30.718078;
long_right_100=31.754786;
lat_lower_100=29.593433;
lat_upper_100=30.497483;

% %these are the square border around hurgada50*50 centered at Cairo

long_left_50=30.976869;
long_right_50=31.498322;
lat_lower_50=29.816108;
lat_upper_50=30.276708;


% %these are the square border around hurgada 20*20 centered at Cairo
long_left_20=31.131281;
long_right_20= 31.340128;
lat_lower_20= 29.955092;
lat_upper_20= 30.135456 ;


dir_list=dir('*.hdf');

for k=1:length(dir_list) ;

    
% % %these are the square border around hurgada200*200 centered at Cairo
long_left=30.676111;
long_right=32.274503;
lat_lower=29.129733;
lat_upper=30.949689;

% % %these are the square border around hurgada150*150 centered at Cairo
long_left_150=30.461092;
long_right_150=32.016258;
lat_lower_150=29.368631;
lat_upper_150=30.719644;

% % %these are the square border around hurgada100*100 centered at Cairo

long_left_100=30.718078;
long_right_100=31.754786;
lat_lower_100=29.593433;
lat_upper_100=30.497483;

% %these are the square border around hurgada50*50 centered at Cairo

long_left_50=30.976869;
long_right_50=31.498322;
lat_lower_50=29.816108;
lat_upper_50=30.276708;


% %these are the square border around hurgada 20*20 centered at Cairo
long_left_20=31.131281;
long_right_20= 31.340128;
lat_lower_20= 29.955092;
lat_upper_20= 30.135456 ;
    
    
    dir_list=dir('*.hdf');
    FileName1=dir_list(k).name;
    [token1, remain1]=strtok(FileName1,'.');
    [token11, remain11]=strtok(remain1,'.');
    day1=str2double(token11(6:8));
    latitude1=hdfread(FileName1,'Latitude');
    longitude1=hdfread(FileName1,'Longitude');
    AOD1=hdfread(FileName1,'AOD_550_Dark_Target_Deep_Blue_Combined');
    FileName2=dir_list(k+1).name;
    [token2, remain2]=strtok(FileName2,'.');
    [token22, remain22]=strtok(remain2,'.');
    day2=str2double(token22(6:8));
    latitude2=hdfread(FileName2,'Latitude');
    longitude2=hdfread(FileName2,'Longitude');
    AOD2=hdfread(FileName2,'AOD_550_Dark_Target_Deep_Blue_Combined');
    FileName3=dir_list(k+2).name;
    [token3, remain3]=strtok(FileName3,'.');
    [token33, remain33]=strtok(remain3,'.');
    day3=str2double(token33(6:8));
    latitude3=hdfread(FileName3,'Latitude');
    longitude3=hdfread(FileName3,'Longitude');
    AOD3=hdfread(FileName3,'AOD_550_Dark_Target_Deep_Blue_Combined');
    FileName4=dir_list(k+3).name;
    [token4, remain4]=strtok(FileName4,'.');
    [token44, remain44]=strtok(remain4,'.');
    day4=str2double(token44(6:8));
    latitude4=hdfread(FileName4,'Latitude');
    longitude4=hdfread(FileName4,'Longitude');
    AOD4=hdfread(FileName4,'AOD_550_Dark_Target_Deep_Blue_Combined');
    
    if (day1==day2)  & (day1==day3) & (day1==day4)
        [rows,columns]=size(latitude1);
        cont=1;
        for i=1:1:rows  ;
            for j=1:1:columns;
                
                if    (long_left <= longitude1(i,j)) & (longitude1(i,j)<=long_right);
                    if (lat_lower <= latitude1(i,j)) & (latitude1(i,j) <= lat_upper);
                        long_cairo(i,j,:)=longitude1(i,j);
                        lat_cairo(i,j,:)=latitude1(i,j);
                        AOD_cairo(i,j,:)=AOD1(i,j);
                        long_cairo_eff(cont)=longitude1(i,j);
                        lat_cairo_eff(cont)=latitude1(i,j);
                        AOD_cairo_eff(cont)=AOD1(i,j);
                        cont=cont+1;
                    end
                end
                
                
            end
        end
        if cont~=1
            effective_points_AOD=0;
            numpo_AOD_cairo=length(AOD_cairo_eff);
            for rr=1:1:numpo_AOD_cairo
                if AOD_cairo_eff(rr)~=-9999
                    effective_points_AOD=effective_points_AOD+1;
                end
            end
        end
        [rows,columns]=size(latitude2);
        cont=1;
        for i=1:1:rows  ;
            for j=1:1:columns;
                
                if    (long_left <=longitude2(i,j)) & (longitude2(i,j)<=long_right);
                    if (lat_lower <= latitude2(i,j)) & (latitude2(i,j) <= lat_upper);
                        long_cairo(i,j,:)=longitude2(i,j);
                        lat_cairo(i,j,:)=latitude2(i,j);
                        AOD_cairo(i,j,:)=AOD2(i,j);
                        long_cairo_eff(cont)=longitude2(i,j);
                        lat_cairo_eff(cont)=latitude2(i,j);
                        AOD_cairo_eff(cont)=AOD2(i,j);
                        cont=cont+1;
                    end
                end
                
                
            end
        end
        if cont~=1
            effective_points_AOD=0;
            numpo_AOD_cairo=length(AOD_cairo_eff);
            for rr=1:1:numpo_AOD_cairo
                if AOD_cairo_eff(rr)~=-9999
                    effective_points_AOD=effective_points_AOD+1;
                end
            end
        end
        [rows,columns]=size(latitude3);
        cont=1;
        for i=1:1:rows  ;
            for j=1:1:columns;
                
                if    (long_left <=longitude3(i,j)) & (longitude3(i,j)<=long_right);
                    if (lat_lower <= latitude3(i,j)) & (latitude3(i,j) <= lat_upper);
                        long_cairo(i,j,:)=longitude3(i,j);
                        lat_cairo(i,j,:)=latitude3(i,j);
                        AOD_cairo(i,j,:)=AOD3(i,j);
                        long_cairo_eff(cont)=longitude3(i,j);
                        lat_cairo_eff(cont)=latitude3(i,j);
                        AOD_cairo_eff(cont)=AOD3(i,j);
                        cont=cont+1;
                    end
                end
                
                
            end
        end
        if cont~=1
            effective_points_AOD=0;
            numpo_AOD_cairo=length(AOD_cairo_eff);
            for rr=1:1:numpo_AOD_cairo
                if AOD_cairo_eff(rr)~=-9999
                    effective_points_AOD=effective_points_AOD+1;
                end
            end
        end
        [rows,columns]=size(latitude4);
        cont=1;
        for i=1:1:rows  ;
            for j=1:1:columns;
                
                if    (long_left <=longitude4(i,j)) & (longitude4(i,j)<=long_right);
                    if (lat_lower <= latitude4(i,j)) & (latitude4(i,j) <= lat_upper);
                        long_cairo(i,j,:)=longitude4(i,j);
                        lat_cairo(i,j,:)=latitude4(i,j);
                        AOD_cairo(i,j,:)=AOD4(i,j);
                        long_cairo_eff(cont)=longitude4(i,j);
                        lat_cairo_eff(cont)=latitude4(i,j);
                        AOD_cairo_eff(cont)=AOD4(i,j);
                        cont=cont+1;
                    end
                end
                
                
            end
        end
        if cont~=1
            effective_points_AOD=0;
            numpo_AOD_cairo=length(AOD_cairo_eff);
            for rr=1:1:numpo_AOD_cairo
                if AOD_cairo_eff(rr)~=-9999
                    effective_points_AOD=effective_points_AOD+1;
                end
            end
        end
        AOD_double=double(AOD_cairo_eff);
        AOD_new=AOD_double*0.001;
        len=length(AOD_new);
        for hh=1:1:len
            if AOD_new(hh)==-9.999;
                AOD_new(hh)=0;
            end
        end
        average=sum(AOD_new)/effective_points_AOD;
        %%%%%these are the square border around cairo 150*150 centered at Assuit
        [rows_150,columns_150]=size(latitude1);
        cont150=1;
        for i=1:1:rows_150  ;
            for j=1:1:columns_150;
                
                if    (long_left_150 <=longitude1(i,j)) & (longitude1(i,j)<=long_right_150);
                    if (lat_lower_150 <= latitude1(i,j)) & (latitude1(i,j) <= lat_upper_150);
                        long_cairo_150(i,j,:)=longitude1(i,j);
                        lat_cairo_150(i,j,:)=latitude1(i,j);
                        AOD_cairo_150(i,j,:)=AOD1(i,j);
                        long_cairo_eff_150(cont150)=longitude1(i,j);
                        lat_cairo_eff_150(cont150)=latitude1(i,j);
                        AOD_cairo_eff_150(cont150)=AOD1(i,j);
                        cont150=cont150+1;
                    end
                end
                
                
            end
        end
        if cont150~=1
            effective_points_AOD_150=0;
            numpo_AOD_cairo_150=length(AOD_cairo_eff_150);
            for rr=1:1:numpo_AOD_cairo_150
                if AOD_cairo_eff_150(rr)~=-9999
                    effective_points_AOD_150=effective_points_AOD_150+1;
                end
            end
        end
        [rows_150,columns_150]=size(latitude2);
        cont150=1;
        for i=1:1:rows_150  ;
            for j=1:1:columns_150;
                
                if    (long_left_150 <=longitude2(i,j)) & (longitude2(i,j)<=long_right_150);
                    if (lat_lower_150<= latitude2(i,j)) & (latitude2(i,j) <= lat_upper_150);
                        long_cairo_150(i,j,:)=longitude2(i,j);
                        lat_cairo_150(i,j,:)=latitude2(i,j);
                        AOD_cairo_150(i,j,:)=AOD2(i,j);
                        long_cairo_eff_150(cont150)=longitude2(i,j);
                        lat_cairo_eff_150(cont150)=latitude2(i,j);
                        AOD_cairo_eff_150(cont150)=AOD2(i,j);
                        cont150=cont150+1;
                    end
                end
                
                
            end
        end
        if cont150~=1
            effective_points_AOD_150=0;
            numpo_AOD_cairo_150=length(AOD_cairo_eff_150);
            for rr=1:1:numpo_AOD_cairo_150
                if AOD_cairo_eff_150(rr)~=-9999
                    effective_points_AOD_150=effective_points_AOD_150+1;
                end
            end
        end
        [rows_150,columns_150]=size(latitude3);
        cont150=1;
        for i=1:1:rows_150  ;
            for j=1:1:columns_150;
                
                if    (long_left_150 <=longitude3(i,j)) & (longitude3(i,j)<=long_right_150);
                    if (lat_lower_150 <= latitude3(i,j)) & (latitude3(i,j) <= lat_upper_150);
                        long_cairo_150(i,j,:)=longitude3(i,j);
                        lat_cairo_150(i,j,:)=latitude3(i,j);
                        AOD_cairo_150(i,j,:)=AOD3(i,j);
                        long_cairo_eff_150(cont150)=longitude3(i,j);
                        lat_cairo_eff_150(cont150)=latitude3(i,j);
                        AOD_cairo_eff_150(cont150)=AOD3(i,j);
                        cont150=cont150+1;
                    end
                end
                
                
            end
        end
        if cont150~=1
            effective_points_AOD_150=0;
            numpo_AOD_cairo_150=length(AOD_cairo_eff_150);
            for rr=1:1:numpo_AOD_cairo_150
                if AOD_cairo_eff_150(rr)~=-9999
                    effective_points_AOD_150=effective_points_AOD_150+1;
                end
            end
        end
        [rows_150,columns_150]=size(latitude4);
        cont150=1;
        for i=1:1:rows_150  ;
            for j=1:1:columns_150;
                
                if    (long_left_150 <=longitude4(i,j)) & (longitude4(i,j)<=long_right_150);
                    if (lat_lower_150 <= latitude4(i,j)) & (latitude4(i,j) <= lat_upper_150);
                        long_cairo_150(i,j,:)=longitude4(i,j);
                        lat_cairo_150(i,j,:)=latitude4(i,j);
                        AOD_cairo_150(i,j,:)=AOD4(i,j);
                        long_cairo_eff_150(cont150)=longitude4(i,j);
                        lat_cairo_eff_150(cont150)=latitude4(i,j);
                        AOD_cairo_eff_150(cont150)=AOD4(i,j);
                        cont150=cont150+1;
                    end
                end
                
                
            end
        end
        if cont150~=1
            effective_points_AOD_150=0;
            numpo_AOD_cairo_150=length(AOD_cairo_eff_150);
            for rr=1:1:numpo_AOD_cairo_150
                if AOD_cairo_eff_150(rr)~=-9999
                    effective_points_AOD_150=effective_points_AOD_150+1;
                end
            end
        end
        AOD_double_150=double(AOD_cairo_eff_150);
        AOD_new_150=AOD_double_150*0.001;
        len_150=length(AOD_new_150);
        for hh=1:1:len_150
            if AOD_new_150(hh)==-9.999;
                AOD_new_150(hh)=0;
            end
        end
        average_150=sum(AOD_new_150)/effective_points_AOD_150;
        %%%%these are the square border around cairo 100*100 centered at Assuit
        [rows_100,columns_100]=size(latitude1);
        cont100=1;
        for i=1:1:rows_100  ;
            for j=1:1:columns_100;
                
                if    (long_left_100 <=longitude1(i,j)) & (longitude1(i,j)<=long_right_100);
                    if (lat_lower_100 <= latitude1(i,j)) & (latitude1(i,j) <= lat_upper_100);
                        long_cairo_100(i,j,:)=longitude1(i,j);
                        lat_cairo_100(i,j,:)=latitude1(i,j);
                        AOD_cairo_100(i,j,:)=AOD1(i,j);
                        long_cairo_eff_100(cont100)=longitude1(i,j);
                        lat_cairo_eff_100(cont100)=latitude1(i,j);
                        AOD_cairo_eff_100(cont100)=AOD1(i,j);
                        cont100=cont100+1;
                    end
                end
                
                
            end
        end
        if cont100~=1
            effective_points_AOD_100=0;
            numpo_AOD_cairo_100=length(AOD_cairo_eff_100);
            for rr=1:1:numpo_AOD_cairo_100
                if AOD_cairo_eff_100(rr)~=-9999
                    effective_points_AOD_100=effective_points_AOD_100+1;
                end
            end
        end
        [rows_100,columns_100]=size(latitude2);
        cont100=1;
        for i=1:1:rows_100  ;
            for j=1:1:columns_100;
                
                if    (long_left_100 <=longitude2(i,j)) & (longitude2(i,j)<=long_right_100);
                    if (lat_lower_100<= latitude2(i,j)) & (latitude2(i,j) <= lat_upper_100);
                        long_cairo_100(i,j,:)=longitude2(i,j);
                        lat_cairo_100(i,j,:)=latitude2(i,j);
                        AOD_cairo_100(i,j,:)=AOD2(i,j);
                        long_cairo_eff_100(cont100)=longitude2(i,j);
                        lat_cairo_eff_100(cont100)=latitude2(i,j);
                        AOD_cairo_eff_100(cont100)=AOD2(i,j);
                        cont100=cont100+1;
                    end
                end
                
                
            end
        end
        if cont100~=1
            effective_points_AOD_100=0;
            numpo_AOD_cairo_100=length(AOD_cairo_eff_100);
            for rr=1:1:numpo_AOD_cairo_100
                if AOD_cairo_eff_100(rr)~=-9999
                    effective_points_AOD_100=effective_points_AOD_100+1;
                end
            end
        end
        [rows_100,columns_100]=size(latitude3);
        cont100=1;
        for i=1:1:rows_100  ;
            for j=1:1:columns_100;
                
                if    (long_left_100 <=longitude3(i,j)) & (longitude3(i,j)<=long_right_100);
                    if (lat_lower_100 <= latitude3(i,j)) & (latitude3(i,j) <= lat_upper_100);
                        long_cairo_100(i,j,:)=longitude3(i,j);
                        lat_cairo_100(i,j,:)=latitude3(i,j);
                        AOD_cairo_100(i,j,:)=AOD3(i,j);
                        long_cairo_eff_100(cont100)=longitude3(i,j);
                        lat_cairo_eff_100(cont100)=latitude3(i,j);
                        AOD_cairo_eff_100(cont100)=AOD3(i,j);
                        cont100=cont100+1;
                    end
                end
                
                
            end
        end
        if cont100~=1
            effective_points_AOD_100=0;
            numpo_AOD_cairo_100=length(AOD_cairo_eff_100);
            for rr=1:1:numpo_AOD_cairo_100
                if AOD_cairo_eff_100(rr)~=-9999
                    effective_points_AOD_100=effective_points_AOD_100+1;
                end
            end
        end
        [rows_100,columns_100]=size(latitude4);
        cont100=1;
        for i=1:1:rows_100  ;
            for j=1:1:columns_100;
                
                if    (long_left_100 <=longitude4(i,j)) & (longitude4(i,j)<=long_right_100);
                    if (lat_lower_100 <= latitude4(i,j)) & (latitude4(i,j) <= lat_upper_100);
                        long_cairo_100(i,j,:)=longitude4(i,j);
                        lat_cairo_100(i,j,:)=latitude4(i,j);
                        AOD_cairo_100(i,j,:)=AOD4(i,j);
                        long_cairo_eff_100(cont100)=longitude4(i,j);
                        lat_cairo_eff_100(cont100)=latitude4(i,j);
                        AOD_cairo_eff_100(cont100)=AOD4(i,j);
                        cont100=cont100+1;
                    end
                end
                
                
            end
        end
        if cont100~=1
            effective_points_AOD_100=0;
            numpo_AOD_cairo_100=length(AOD_cairo_eff_100);
            for rr=1:1:numpo_AOD_cairo_100
                if AOD_cairo_eff_100(rr)~=-9999
                    effective_points_AOD_100=effective_points_AOD_100+1;
                end
            end
        end
        AOD_double_100=double(AOD_cairo_eff_100);
        AOD_new_100=AOD_double_100*0.001;
        len_100=length(AOD_new_100);
        for hh=1:1:len_100
            if AOD_new_100(hh)==-9.999;
                AOD_new_100(hh)=0;
            end
        end
        average_100=sum(AOD_new_100)/effective_points_AOD_100;
        %%%%these are the square border around cairo 50*50 centered at Assuit
        [rows_50,columns_50]=size(latitude1);
        cont50=1;
        for i=1:1:rows_50  ;
            for j=1:1:columns_50;
                
                if    (long_left_50 <=longitude1(i,j)) & (longitude1(i,j)<=long_right_50);
                    if (lat_lower_50 <= latitude1(i,j)) & (latitude1(i,j) <= lat_upper_50);
                        long_cairo_50(i,j,:)=longitude1(i,j);
                        lat_cairo_50(i,j,:)=latitude1(i,j);
                        AOD_cairo_50(i,j,:)=AOD1(i,j);
                        long_cairo_eff_50(cont50)=longitude1(i,j);
                        lat_cairo_eff_50(cont50)=latitude1(i,j);
                        AOD_cairo_eff_50(cont50)=AOD1(i,j);
                        cont50=cont50+1;
                    end
                end
                
                
            end
        end
        if cont50~=1
            effective_points_AOD_50=0;
            numpo_AOD_cairo_50=length(AOD_cairo_eff_50);
            for rr=1:1:numpo_AOD_cairo_50
                if AOD_cairo_eff_50(rr)~=-9999
                    effective_points_AOD_50=effective_points_AOD_50+1;
                end
            end
        end
        [rows_50,columns_50]=size(latitude2);
        cont50=1;
        for i=1:1:rows_50  ;
            for j=1:1:columns_50;
                
                if    (long_left_50 <=longitude2(i,j)) & (longitude2(i,j)<=long_right_50);
                    if (lat_lower_50 <= latitude2(i,j)) & (latitude2(i,j) <= lat_upper_50);
                        long_cairo_50(i,j,:)=longitude2(i,j);
                        lat_cairo_50(i,j,:)=latitude2(i,j);
                        AOD_cairo_50(i,j,:)=AOD2(i,j);
                        long_cairo_eff_50(cont50)=longitude2(i,j);
                        lat_cairo_eff_50(cont50)=latitude2(i,j);
                        AOD_cairo_eff_50(cont50)=AOD2(i,j);
                        cont50=cont50+1;
                    end
                end
                
                
            end
        end
        if cont50~=1
            effective_points_AOD_50=0;
            numpo_AOD_cairo_50=length(AOD_cairo_eff_50);
            for rr=1:1:numpo_AOD_cairo_50
                if AOD_cairo_eff_50(rr)~=-9999
                    effective_points_AOD_50=effective_points_AOD_50+1;
                end
            end
        end
        [rows_50,columns_50]=size(latitude3);
        cont50=1;
        for i=1:1:rows_50  ;
            for j=1:1:columns_50;
                
                if    (long_left_50 <=longitude3(i,j)) & (longitude3(i,j)<=long_right_50);
                    if (lat_lower_50 <= latitude3(i,j)) & (latitude3(i,j) <= lat_upper_50);
                        long_cairo_50(i,j,:)=longitude3(i,j);
                        lat_cairo_50(i,j,:)=latitude3(i,j);
                        AOD_cairo_50(i,j,:)=AOD3(i,j);
                        long_cairo_eff_50(cont50)=longitude3(i,j);
                        lat_cairo_eff_50(cont50)=latitude3(i,j);
                        AOD_cairo_eff_50(cont50)=AOD3(i,j);
                        cont50=cont50+1;
                    end
                end
                
                
            end
        end
        if cont50~=1
            effective_points_AOD_50=0;
            numpo_AOD_cairo_50=length(AOD_cairo_eff_50);
            for rr=1:1:numpo_AOD_cairo_50
                if AOD_cairo_eff_50(rr)~=-9999
                    effective_points_AOD_50=effective_points_AOD_50+1;
                end
            end
        end
        [rows_50,columns_50]=size(latitude4);
        cont50=1;
        for i=1:1:rows_50  ;
            for j=1:1:columns_50;
                
                if    (long_left_50 <=longitude4(i,j)) & (longitude4(i,j)<=long_right_50);
                    if (lat_lower_50 <= latitude4(i,j)) & (latitude4(i,j) <= lat_upper_50);
                        long_cairo_50(i,j,:)=longitude4(i,j);
                        lat_cairo_50(i,j,:)=latitude4(i,j);
                        AOD_cairo_50(i,j,:)=AOD4(i,j);
                        long_cairo_eff_50(cont50)=longitude4(i,j);
                        lat_cairo_eff_50(cont50)=latitude4(i,j);
                        AOD_cairo_eff_50(cont50)=AOD4(i,j);
                        cont50=cont50+1;
                    end
                end
                
                
            end
        end
        if cont50~=1
            effective_points_AOD_50=0;
            numpo_AOD_cairo_50=length(AOD_cairo_eff_50);
            for rr=1:1:numpo_AOD_cairo_50
                if AOD_cairo_eff_50(rr)~=-9999
                    effective_points_AOD_50=effective_points_AOD_50+1;
                end
            end
        end
        AOD_double_50=double(AOD_cairo_eff_50);
        AOD_new_50=AOD_double_50*0.001;
        len_50=length(AOD_new_50);
        for hh=1:1:len_50
            if AOD_new_50(hh)==-9.999;
                AOD_new_50(hh)=0;
            end
        end
        average_50=sum(AOD_new_50)/effective_points_AOD_50;
        %%%%these are the square border around cairo 20*20 centered at Assuit
        
        [rows_20,columns_20]=size(latitude1);
        cont20=1;
        for i=1:1:rows_20  ;
            for j=1:1:columns_20;
                
                if    (long_left_20 <=longitude1(i,j)) & (longitude1(i,j)<=long_right_20);
                    if (lat_lower_20 <= latitude1(i,j)) & (latitude1(i,j) <= lat_upper_20);
                        long_cairo_20(i,j,:)=longitude1(i,j);
                        lat_cairo_20(i,j,:)=latitude1(i,j);
                        AOD_cairo_20(i,j,:)=AOD1(i,j);
                        long_cairo_eff_20(cont20)=longitude1(i,j);
                        lat_cairo_eff_20(cont20)=latitude1(i,j);
                        AOD_cairo_eff_20(cont20)=AOD1(i,j);
                        cont20=cont20+1;
                    end
                end
                
                
            end
        end
        if cont20~=1
            effective_points_AOD_20=0;
            numpo_AOD_cairo_20=length(AOD_cairo_eff_20);
            for rr=1:1:numpo_AOD_cairo_20
                if AOD_cairo_eff_20(rr)~=-9999
                    effective_points_AOD_20=effective_points_AOD_20+1;
                end
            end
        end
        [rows_20,columns_20]=size(latitude2);
        cont20=1;
        for i=1:1:rows_20  ;
            for j=1:1:columns_20;
                
                if    (long_left_20 <=longitude2(i,j)) & (longitude2(i,j)<=long_right_20);
                    if (lat_lower_20 <= latitude2(i,j)) & (latitude2(i,j) <= lat_upper_20);
                        long_cairo_20(i,j,:)=longitude2(i,j);
                        lat_cairo_20(i,j,:)=latitude2(i,j);
                        AOD_cairo_20(i,j,:)=AOD2(i,j);
                        long_cairo_eff_20(cont20)=longitude2(i,j);
                        lat_cairo_eff_20(cont20)=latitude2(i,j);
                        AOD_cairo_eff_20(cont20)=AOD2(i,j);
                        cont20=cont20+1;
                    end
                end
                
                
            end
        end
        if cont20~=1
            effective_points_AOD_20=0;
            numpo_AOD_cairo_20=length(AOD_cairo_eff_20);
            for rr=1:1:numpo_AOD_cairo_20
                if AOD_cairo_eff_20(rr)~=-9999
                    effective_points_AOD_20=effective_points_AOD_20+1;
                end
            end
        end
        [rows_20,columns_20]=size(latitude3);
        cont20=1;
        for i=1:1:rows_20  ;
            for j=1:1:columns_20;
                
                if    (long_left_20 <=longitude3(i,j)) & (longitude3(i,j)<=long_right_20);
                    if (lat_lower_20 <= latitude3(i,j)) & (latitude3(i,j) <= lat_upper_20);
                        long_cairo_20(i,j,:)=longitude3(i,j);
                        lat_cairo_20(i,j,:)=latitude3(i,j);
                        AOD_cairo_20(i,j,:)=AOD3(i,j);
                        long_cairo_eff_20(cont20)=longitude3(i,j);
                        lat_cairo_eff_20(cont20)=latitude3(i,j);
                        AOD_cairo_eff_20(cont20)=AOD3(i,j);
                        cont20=cont20+1;
                    end
                end
                
                
            end
        end
        if cont20~=1
            effective_points_AOD_20=0;
            numpo_AOD_cairo_20=length(AOD_cairo_eff_20);
            for rr=1:1:numpo_AOD_cairo_20
                if AOD_cairo_eff_20(rr)~=-9999
                    effective_points_AOD_20=effective_points_AOD_20+1;
                end
            end
        end
        [rows_20,columns_20]=size(latitude4);
        cont20=1;
        for i=1:1:rows_20  ;
            for j=1:1:columns_20;
                
                if    (long_left_20 <=longitude4(i,j)) & (longitude4(i,j)<=long_right_20);
                    if (lat_lower_20 <= latitude4(i,j)) & (latitude4(i,j) <= lat_upper_20);
                        long_cairo_20(i,j,:)=longitude4(i,j);
                        lat_cairo_20(i,j,:)=latitude4(i,j);
                        AOD_cairo_20(i,j,:)=AOD4(i,j);
                        long_cairo_eff_20(cont20)=longitude4(i,j);
                        lat_cairo_eff_20(cont20)=latitude4(i,j);
                        AOD_cairo_eff_20(cont20)=AOD4(i,j);
                        cont20=cont20+1;
                    end
                end
                
                
            end
        end
        if cont20~=1
            effective_points_AOD_20=0;
            numpo_AOD_cairo_20=length(AOD_cairo_eff_20);
            for rr=1:1:numpo_AOD_cairo_20
                if AOD_cairo_eff_20(rr)~=-9999
                    effective_points_AOD_20=effective_points_AOD_20+1;
                end
            end
        end
        if cont20==1
            long_cairo_eff_20=NaN;
            lat_cairo_eff_20=NaN;
            AOD_cairo_eff_20=NaN;
            numpo_AOD_cairo_20=NaN;
            effective_points_AOD_20=NaN;
        end
        
        AOD_double_20=double(AOD_cairo_eff_20);
        AOD_new_20=AOD_double_20*0.001;
        len_20=length(AOD_new_20);
        for hh=1:1:len_20
            if AOD_new_20(hh)==-9.999;
                AOD_new_20(hh)=0;
            end
        end
        average_20=sum(AOD_new_20)/effective_points_AOD_20;
        vec_num_points_AOD(k)=numpo_AOD_cairo;
        f_out = [FileName1, int2str(day1), 'Cairo.mat'];
        save(f_out,'average','long_cairo','lat_cairo','long_cairo_eff','lat_cairo_eff','AOD_cairo_eff'...
            ,'AOD_cairo','numpo_AOD_cairo','effective_points_AOD','average_150','effective_points_AOD_150'...
            ,'numpo_AOD_cairo_150','average_100','effective_points_AOD_100'...
            ,'numpo_AOD_cairo_100','average_50','effective_points_AOD_50'...
            ,'numpo_AOD_cairo_50','average_20','effective_points_AOD_20'...
            ,'numpo_AOD_cairo_20')
        movefile(f_out,'D:\MODIS data over egypt 2003_2014\all\Mat_cairo');
        if k==length(dir_list)-3;
            break;
        end
    end
    clear;close
    
end
