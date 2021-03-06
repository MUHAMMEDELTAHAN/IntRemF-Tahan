% clear
% clc
% % %these are the square border around hurgada200*200 centered at hurgada
long_left=32.8006006;
long_right=34.824394;
lat_lower=26.270889;
lat_upper=28.088844;
% % %these are the square border around hurgada150*150 centered at hurgada
long_left_150=33.052994;
long_right_150=34.568517;
lat_lower_150=26.506825;
lat_upper_150=27.863225;
% % %these are the square border around hurgada100*100 centered at hurgada
long_left_100=33.303819;
long_right_100=34.316883;
lat_lower_100=26.729928;
lat_upper_100=27.637031;
% %these are the square border around hurgada50*50 centered at hurgada
long_left_50=30.918172;
long_right_50=31.423847;
lat_lower_50=26.937189;
lat_upper_50=27.38835;
% %these are the square border around hurgada 20*20 centered at hurgada
long_left_20=31.06995;
long_right_20=31.274661;
lat_lower_20=27.071214;
lat_upper_20=27.253911;

dir_list=dir('*.mat');

for k=1:length(dir_list) ;
    % % %these are the square border around hurgada200*200 centered at hurgada
long_left=32.8006006;
long_right=34.824394;
lat_lower=26.270889;
lat_upper=28.088844;
% % %these are the square border around hurgada150*150 centered at hurgada
long_left_150=33.052994;
long_right_150=34.568517;
lat_lower_150=26.506825;
lat_upper_150=27.863225;
% % %these are the square border around hurgada100*100 centered at hurgada
long_left_100=33.303819;
long_right_100=34.316883;
lat_lower_100=26.729928;
lat_upper_100=27.637031;
% %these are the square border around hurgada50*50 centered at hurgada
long_left_50=30.918172;
long_right_50=31.423847;
lat_lower_50=26.937189;
lat_upper_50=27.38835;
% %these are the square border around hurgada 20*20 centered at hurgada
long_left_20=31.06995;
long_right_20=31.274661;
lat_lower_20=27.071214;
lat_upper_20=27.253911;
    
    dir_list=dir('*.mat');
    FileName1=dir_list(k).name;
    [token1, remain1]=strtok(FileName1,'.');
    [token11, remain11]=strtok(remain1,'.');
    [token12, remain12]=strtok(remain11,'.');
    [token13, remain13]=strtok(remain12,'.');
    [token14, remain14]=strtok(remain13,'.');
    year1=(token11(1:5));
    day1=str2double(token11(6:8));
    FileName2=dir_list(k+1).name;
    [token2, remain2]=strtok(FileName2,'.');
    [token22, remain22]=strtok(remain2,'.');
    day2=str2double(token22(6:8));
    diff=day2-day1;
    if diff>1
        for i=1:203
            for j=1:135
                latitude1(i,j)=0;
                longitude1(i,j)=0;
                AOD1(i,j)=-9999;
            end
        end
        [rows,columns]=size(latitude1);
        cont=1;
        for i=1:1:rows;
            for j=1:1:columns;
                
                %if    (long_left <=longitude1(i,j)) & (longitude1(i,j)<=long_right);
                %if (lat_lower <= latitude1(i,j)) & (latitude1(i,j) <= lat_upper);
                long_cairo(i,j,:)=longitude1(i,j);
                lat_cairo(i,j,:)=latitude1(i,j);
                AOD_cairo(i,j,:)=AOD1(i,j);
                long_cairo_eff(cont)=longitude1(i,j);
                lat_cairo_eff(cont)=latitude1(i,j);
                AOD_cairo_eff(cont)=AOD1(i,j);
                long_cairo_150(i,j,:)=longitude1(i,j);
                lat_cairo_150(i,j,:)=latitude1(i,j);
                AOD_cairo_150(i,j,:)=AOD1(i,j);
                long_cairo_eff_150(cont)=longitude1(i,j);
                lat_cairo_eff_150(cont)=latitude1(i,j);
                AOD_cairo_eff_150(cont)=AOD1(i,j);
                long_cairo_20(i,j,:)=longitude1(i,j);
                lat_cairo_20(i,j,:)=latitude1(i,j);
                AOD_cairo_20(i,j,:)=AOD1(i,j);
                long_cairo_eff_20(cont)=longitude1(i,j);
                lat_cairo_eff_20(cont)=latitude1(i,j);
                AOD_cairo_eff_20(cont)=AOD1(i,j);
                long_cairo_100(i,j,:)=longitude1(i,j);
                lat_cairo_100(i,j,:)=latitude1(i,j);
                AOD_cairo_100(i,j,:)=AOD1(i,j);
                long_cairo_eff_100(cont)=longitude1(i,j);
                lat_cairo_eff_100(cont)=latitude1(i,j);
                AOD_cairo_eff_100(cont)=AOD1(i,j);
                long_cairo_50(i,j,:)=longitude1(i,j);
                lat_cairo_50(i,j,:)=latitude1(i,j);
                AOD_cairo_50(i,j,:)=AOD1(i,j);
                long_cairo_eff_50(cont)=longitude1(i,j);
                lat_cairo_eff_50(cont)=latitude1(i,j);
                AOD_cairo_eff_50(cont)=AOD1(i,j);
                cont=cont+1;
                %end
                %end
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
        if cont~=1
            effective_points_AOD_150=0;
            numpo_AOD_cairo_150=length(AOD_cairo_eff_150);
            for rr=1:1:numpo_AOD_cairo_150
                if AOD_cairo_eff_150(rr)~=-9999
                    effective_points_AOD_150=effective_points_AOD_150+1;
                end
            end
            
        end
        if cont~=1
            effective_points_AOD_100=0;
            numpo_AOD_cairo_100=length(AOD_cairo_eff_100);
            for rr=1:1:numpo_AOD_cairo_100
                if AOD_cairo_eff_100(rr)~=-9999
                    effective_points_AOD_100=effective_points_AOD_100+1;
                end
            end
            
        end
        if cont~=1
            effective_points_AOD_50=0;
            numpo_AOD_cairo_50=length(AOD_cairo_eff_50);
            for rr=1:1:numpo_AOD_cairo_50
                if AOD_cairo_eff_50(rr)~=-9999
                    effective_points_AOD_50=effective_points_AOD_50+1;
                end
            end
            
        end
        if cont~=1
            effective_points_AOD_20=0;
            numpo_AOD_cairo_20=length(AOD_cairo_eff_20);
            for rr=1:1:numpo_AOD_cairo_20
                if AOD_cairo_eff_20(rr)~=-9999
                    effective_points_AOD_20=effective_points_AOD_20+1;
                end
            end
            
        end
        
    end
    for n=1:diff-1
        day=day1+n;
        day_n=day;
        day_w=num2str(day);
        name=[token1,'.',year1,day_w,'.',token12,'.',token13,'.',token14,'.','hdf'];
        %       FileName=token1
        AOD_double=double(AOD_cairo_eff);
        AOD_new=AOD_double*0.001;
        len=length(AOD_new);
        for hh=1:1:len
            if AOD_new(hh)==-9.999;
                AOD_new(hh)=0;
            end
        end
        average=sum(AOD_new)/effective_points_AOD;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        AOD_double_150=double(AOD_cairo_eff_150);
        AOD_new_150=AOD_double_150*0.001;
        len_150=length(AOD_new_150);
        for hh=1:1:len_150
            if AOD_new_150(hh)==-9.999;
                AOD_new_150(hh)=0;
            end
        end
        average_150=sum(AOD_new_150)/effective_points_AOD_150;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
        AOD_double_100=double(AOD_cairo_eff_100);
        AOD_new_100=AOD_double_100*0.001;
        len_100=length(AOD_new_100);
        for hh=1:1:len_100
            if AOD_new_100(hh)==-9.999;
                AOD_new_100(hh)=0;
            end
        end
        average_100=sum(AOD_new_100)/effective_points_AOD_100;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
        AOD_double_50=double(AOD_cairo_eff_50);
        AOD_new_50=AOD_double_50*0.001;
        len_50=length(AOD_new_50);
        for hh=1:1:len_50
            if AOD_new_50(hh)==-9.999;
                AOD_new_50(hh)=0;
            end
        end
        average_50=sum(AOD_new_50)/effective_points_AOD_50;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        AOD_double_20=double(AOD_cairo_eff_20);
        AOD_new_20=AOD_double_20*0.001;
        len_20=length(AOD_new_20);
        for hh=1:1:len_20
            if AOD_new_20(hh)==-9.999;
                AOD_new_20(hh)=0;
            end
        end
        average_20=sum(AOD_new_20)/effective_points_AOD_20;
        f_out = [name, int2str(day_n), 'hurgada.mat'];
        vec_num_points_AOD(k)=numpo_AOD_cairo;
        save(f_out,'average','long_cairo','lat_cairo','long_cairo_eff','lat_cairo_eff','AOD_cairo_eff'...
        ,'AOD_cairo','numpo_AOD_cairo','effective_points_AOD','average_150','effective_points_AOD_150'...
        ,'numpo_AOD_cairo_150','average_100','effective_points_AOD_100'...
        ,'numpo_AOD_cairo_100','average_50','effective_points_AOD_50'...
        ,'numpo_AOD_cairo_50','average_20','effective_points_AOD_20'...
        ,'numpo_AOD_cairo_20')
    movefile(f_out,'G:\seasonal data results over cities\hurgada\12_year');
    end
    if k==length(dir_list)-1;
        break;
    end
    clear;close
end
