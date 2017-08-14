clear
clc
dir_list=dir('*.mat');

for k=1:length(dir_list)
    FileName=dir_list(k).name ;
    load(FileName,'ZI_near');
    ZI_near=single(ZI_near);
    Mtot(:,:,k)=ZI_near;
end
FileName=dir_list(1).name;
load(FileName,'lat','long')
[row ,column]=size(lat);
cc=eye(length(dir_list),1)';
avg=eye(row,column);
for i=1:1:row
    for j=1:1:column
        num=0;
        for k=1:1:length(dir_list)
            if Mtot(i,j,k)==0;
                num=num+1;
            end
            cc(k)=Mtot(i,j,k);
            
        end
        summ=sum(cc);
        makam=length(dir_list)-num;
        avg(i,j)=summ/makam;
    end
end
save('average_Hurgada_seasonal_SON','avg','lat','long')