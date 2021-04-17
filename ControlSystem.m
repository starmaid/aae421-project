

% Longitudinal mode:
% respect to a reference condition at 1m
Lon = tf([2.423, 0.1097],...
         [1,0.3537, 0.1394,0.002024]);
     
Lon_num = [2.423, 0.1097];
Lon_den = [1,0.3537, 0.1394,0.002024];
% input is between 0 and 255, 
% output is height in mm

%{
Outputs from Control System Designer:
Overshoot: 0%
Peak: 54
Settling time: 235
Final Value: 54.2

outputs from Stepinfo
        RiseTime: 125.9308
    SettlingTime: 235.1665
     SettlingMin: 48.7798
     SettlingMax: 54.0779
       Overshoot: 0
      Undershoot: 0
            Peak: 54.0779
        PeakTime: 380.2409
%}


% Lateral motion 1: rotational
% respect to heading angle = 0
Lat1 = tf([0.00835, 0.001745],...
          [1, 4.641e-5, 0.0002839]);

Lat1_num = [0.00835, 0.001745];
Lat1_den = [1, 4.641e-5, 0.0002839];
% input is -255 to 255 control
% output is radian heading

%{
Outputs from Control System Designer:
Overshoot: 99.6%
Peak: 12.3
Settling time: 1.69e5
Final Value: 6.15

stepinfo
        RiseTime: 60.9223
    SettlingTime: 1.6855e+05
     SettlingMin: 0.0530
     SettlingMax: 12.2665
       Overshoot: 99.5683
      Undershoot: 0
            Peak: 12.2665
        PeakTime: 186.4521
%}


% Lateral motion 2: forward
% reference to +0.3 m/s
Lat2 = tf([0.0002557, -0.02031, 0.05613],...
          [1, 0.4456, 27.55, 4.316]);
Lat2_num = [0.0002557, -0.02031, 0.05613];
Lat2_den = [1, 0.4456, 27.55, 4.316];
% input is 0 to 255 pwm control
% output is velocity in m/s

%{
Outputs from Control System Designer:
Overshoot: 0%
Peak: 0.013
Settling time: 24.9
Final Value: 0.013

stepinfo
        RiseTime: 14.2443
    SettlingTime: 24.8737
     SettlingMin: 0.0118
     SettlingMax: 0.0130
       Overshoot: 0
      Undershoot: 3.3515
            Peak: 0.0130
        PeakTime: 49.0103
%}




H = tf([0],[1]);


% plotting for a

figure(1)
plot(Lon_resp.Time, Lon_resp.Data + 1)
xlim([0,500])
title("Open Loop Step Reponse - Altitude")
xlabel("Time (s)")
ylabel("Altitude (m)")
grid on

figure(2)
plot(Lat1_resp.Time, Lat1_resp.Data)
title("Open Loop Step Reponse - Heading")
xlabel("Time (s)")
%xlim([0,1000])
ylabel("Heading (rad)")
grid on

figure(3)
plot(Lat2_resp.Time, Lat2_resp.Data + 0.3)
xlim([0,40])
title("Open Loop Step Reponse - Velocity")
xlabel("Time (s)")
ylabel("Forward Velocity (m/s)")
grid on

figure(4)
rlocus(Lat2);
