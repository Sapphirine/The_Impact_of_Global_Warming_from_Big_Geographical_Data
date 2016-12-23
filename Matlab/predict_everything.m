function [  ] = predict_everything(t_limit)
    below = load('time_temp_sl_below.csv');
    above = load('time_temp_sl_above.csv');
    t = 1:500;
    figure(1)
    figure(2)
    b = 6.5257*10^-4;
    c = 7.48935*10^-4;
    below_above = [37 8];
    
    % scatter first
    figure(1)
    subplot(121);
    scatter(below(:,1),below(:,2)-0.1,'x')
    hold on
    a = 0.0069139;
    y_below = (below_above(1)*90*a*t+b*(-177+179)*90/2+c*(-87+57)*37/2)/(below_above(1)*90) - 0.5;% + 0.4*10^-4*t.*t;
    plot(y_below,'k');
    
    subplot(122);
    scatter(above(:,1),above(:,2),'x')
    hold on
    y_above = (below_above(2)*90*a*t+b*(-177+179)*90/2+c*(57+89)*8/2)/(below_above(2)*90)- 0.5;%+ 0.4*10^-4*t.*t;
    plot(y_above,'k');
    
    
    figure(2)
    subplot(121);
    scatter(below(:,1),below(:,3)/1000,'b','x')
    hold on
    sl_below = (1.68*t + 0.0016*y_below)/1000 + 6.837;
    plot(sl_below,'k')
    
    subplot(122)
    scatter(above(:,1),above(:,3)/1000,'b','x')
    hold on
    sl_above = (-2.3*t + (-0.0068*y_above))/1000 + 7.2204;
    plot(sl_above,'k')
    
    figure(1)
    subplot(121);
    hold on
    a = 0.0129139;
    y_below = (below_above(1)*90*a*t+b*(-177+179)*90/2+c*(-87+57)*37/2)/(below_above(1)*90) - 1.2;% + 0.4*10^-4*t.*t;
    plot(y_below,'r');
    
    subplot(122);
    a = 0.0529139;
    hold on
    y_above = (below_above(2)*90*a*t+b*(-177+179)*90/2+c*(57+89)*8/2)/(below_above(2)*90)- 5;%+ 0.4*10^-4*t.*t;
    plot(y_above,'r');
    
    
    figure(2)
    subplot(121);
    hold on
    sl_below = (y_below+28)/4 ;
    plot(sl_below,'r')
    
    subplot(122)
    hold on
    sl_above = -(y_above-28)/4 ;
    plot(sl_above,'r')
    
    figure(1)
    subplot(121);
    hold on
    a = 0.0069139;
    y_below = (below_above(1)*90*a*t+b*(-177+179)*90/2+c*(-87+57)*37/2)/(below_above(1)*90) - 1.2 + 0.4*10^-4*t.*t;
    plot(y_below,'g');
    
    subplot(122);
    hold on
    y_above = (below_above(2)*90*a*t+b*(-177+179)*90/2+c*(57+89)*8/2)/(below_above(2)*90)- 0.5+  0.4*10^-4*t.*t;
    plot(y_above,'g');
    
    figure(2)
    subplot(121);
    hold on
    sl_below = (0.000018*t.*t)+(1.68*t + 0.0016*y_below)/1000 + 6.837;
    plot(sl_below,'g')
    
    subplot(122)
    hold on
    sl_above = -(0.000025*t.*t)+(-2.3*t + (-0.0068*y_above))/1000 + 7.2204;
    plot(sl_above,'g')
    
    
    
    figure(1)
    subplot(121);
    hold on
    a = 0.0129139;
    y_below = (below_above(1)*90*a*t+b*(-177+179)*90/2+c*(-87+57)*37/2)/(below_above(1)*90) - 1.2 + 0.4*10^-4*t.*t;
    plot(y_below,'m');
    
    subplot(122);
    a = 0.0529139;
    hold on
    y_above = (below_above(2)*90*a*t+b*(-177+179)*90/2+c*(57+89)*8/2)/(below_above(2)*90)- 5 + 0.4*10^-4*t.*t;
    plot(y_above,'m');
    
    
    figure(2)
    subplot(121);
    hold on
    sl_below = (0.000029*t.*t)+(1.68*t + 0.0016*y_below)/1000 + 6.837;
    plot(sl_below,'m')
    
    subplot(122)
    hold on
    sl_above = -(0.00005*t.*t) + (-2.3*t + (-0.0068*y_above))/1000 + 7.2204;
    plot(sl_above,'m')
    
    figure(1)
    subplot(121)
    title('Temperature Anomaly below Lat = 57 degrees');
    legend('Temperature Anomaly','Predicted Temperature without Energy Factor',...
        'Lagging Predicted Temperature without Energy Factor','Predicted Temperature with Energy Factor',...
        'Lagging Predicted Temperature with Energy Factor');
    xlabel('Time stamps')
    ylabel('Temperature in Celsius Degrees')
    xlim(t_limit)
    grid on
    box on

    
    subplot(122)
    title('Temperature Anomaly above Lat = 57 degrees');
    legend('Temperature Anomaly','Predicted Temperature without Energy Factor',...
        'Lagging Predicted Temperature without Energy Factor','Predicted Temperature with Energy Factor',...
        'Lagging Predicted Temperature with Energy Factor');
    xlabel('Time stamps')
    ylabel('Temperature in Celsius Degrees')
    xlim(t_limit)
    grid on
    box on
    
    figure(2)
    subplot(121)
    title('Sea Level below Lat = 57 degrees');
    legend('Sea Level','Predicted Sea without Energy Factor',...
        'Lagging Predicted Sea without Energy Factor','Predicted Sea with Energy Factor',...
        'Lagging Predicted Sea with Energy Factor');
    xlabel('Time stamps')
    ylabel('Sea Level in Meters')
    xlim(t_limit)
    grid on
    box on
    
    subplot(122)
    title('Sea Level above Lat = 57 degrees');
    legend('Sea Level','Predicted Sea without Energy Factor',...
        'Lagging Predicted Sea without Energy Factor','Predicted Sea with Energy Factor',...
        'Lagging Predicted Sea with Energy Factor');
    xlabel('Time stamps')
    ylabel('Sea Level in Meters')
    xlim(t_limit)
    grid on
    box on
    

end



% output_57_above(:,3:end) = [];
% output_57_below(:,3:end) = [];
% % output = [output zeros(size(output,1),1)];
% start = datetime(1800,1,1);
% days_span = caldays(time);
% time_stamp = start + days_span;
% 
% dv = datevec(time_stamp);
% dv = dv(:,1:2);
% dv = unique(dv(:,1));
% output_57_above = [output_57_above zeros(size(output_57_above,1),1)];
% output_57_below = [output_57_below zeros(size(output_57_below,1),1)];
% 
% for j=1:size(output_57_above,1)
%     sl_below = 0;
%     sl_above = 0;
%     below_count = 0;
%     above_count = 0;
%     for s=1:size(data,2)
%         lat1 = data(1,s).latitude;
%         year = data(1,s).year;
%         height = data(1,s).height;
%         idx = find(year == dv(j,1));
%         if lat1<=57
%             if nansum(height(idx,1)) ~= 0
%                 sl_below = sl_below + nansum(height(idx,1))/size(find(~isnan(height(idx,1))),1);
%                 below_count = below_count + 1;
%             end
%             
%         else
%             if nansum(height(idx,1)) ~= 0
%                 sl_above = sl_above + nansum(height(idx,1))/size(find(~isnan(height(idx,1))),1);
%                 above_count = above_count + 1;
%             end
%             
%         end
%     end
%     output_57_above(j,3) = sl_above/above_count;
%     output_57_below(j,3) = sl_below/below_count;
% end

% for s=1:size(data,2)
%     lat1 = data(1,s).latitude;
%     lon1 = data(1,s).longitude;
%     year = data(1,s).year;
%     month = data(1,s).month;
%     height = data(1,s).height;
%     
%     lat1 = round(lat1/4)*4 + 1;
%     lon1 = round(lon1/4)*4 -1;
%     
%     index = find(output(:,2) == lon1 & output(:,3) == lat1);
%     
%     for i=1:size(index,1)
%         idx = find(year == dv(output(index(i,1),1)+1,1) & month == dv(output(index(i,1),1)+1,2));
%         if ~isempty(idx)
%             output(index(i,1),5) = height(idx,1);
%         end
%     end
%     
% end








% output_57_above = [];
% output_57_below = [];
% 
% 
% for t=0:floor(size(time,1)/12)-1
%     temper_sum_above = 0;
%     temper_sum_below = 0;
%     counter_above = 0;
%     counter_below = 0;
%     for i = 1:floor(size(lon,1)/2)
%         for j=1:floor(size(lat,1)/2)
%             for k=1:12
%                 if ~isnan(temper(i*2,j*2,t*12+k))
%                     if lat(j*2,1) <= 57
%                         temper_sum_below = temper_sum_below + temper(i*2,j*2,t*12+k);
%                         counter_below = counter_below + 1;
%                     else
%                         temper_sum_above = temper_sum_above + temper(i*2,j*2,t*12+k);
%                         counter_above = counter_above + 1;
%                     end
%                     
%                 end
%             end
%         end
%     end
%     if counter_below ~= 0 && temper_sum_below ~= 0
%         temper_sum_below = temper_sum_below/counter_below;
%         output_57_below = [output_57_below;t temper_sum_below];
%     end
%     if counter_above ~= 0 && temper_sum_above ~= 0
%         temper_sum_above = temper_sum_above/counter_above;
%         output_57_above = [output_57_above;t temper_sum_above];
%     end
%     
%     
% end










% lon = csvread('lonnordic.csv');
% lat = csvread('latnordic.csv');
% temp = csvread('tempnordic.csv');

% output = [];
% for i = 1:size(lon,1)
%     for j=1:size(lat,1)
%         output = [output;lon(i,1) lat(j,1) i*j temp(i,j)];
% %         if ~isnan(temp(i,j))
% %             output = [output;lon(i,1) lat(j,1)];
% %         end
%     end
% end




% for k=1:size(output,3)
%     start = datetime(1800,1,1);
%     days_span = caldays(time(k,1));
%     time_stamp = start + days_span;
%     formatOut = 'yyyy-mm-dd';
%     filename = strcat(datestr(time_stamp,formatOut), '.txt');
%     csvwrite(filename,output(:,:,k));     
% end
