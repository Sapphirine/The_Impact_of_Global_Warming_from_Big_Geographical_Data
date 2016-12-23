cla
hwydata = csvread('lat_lon_temp_nc.csv',0,0,[0,0,1000000,3]);                             % load data

long = hwydata(:,2);                              % longitude data
lat = hwydata(:,3);                                % latitude data
time = hwydata(:,1);                       % 
temp = hwydata(:,4);                        % 

scatter3(long,lat,time,40,temp,'filled')    % draw the scatter plot
ax = gca;
view(-31,14)
xlabel('W. Longitude')
ylabel('N. Latitude')
zlabel('Time')

cb = colorbar;                                     % create and label the colorbar
cb.Label.String = 'T';