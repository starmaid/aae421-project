eq = 0.3;   % linearization point

figure(1);
plot(step.Time, step.Data + eq, '--'); hold on;
plot(step_response.Time, step_response.Data + eq); grid on;
title("Forward Mode Latitude Controller Response to Step Input");
xlabel("Time (s)");
ylabel("Speed (m/s)");
legend("Step Input", "Control Response", "location", "southeast");

figure(2);
plot(sine.Time, sine.Data + eq, '--'); hold on;
plot(sine_response.Time, sine_response.Data + eq); grid on;
title("Forward Mode Latitude Controller Response to Sine Input");
xlabel("Time (s)");
ylabel("Speed (m/s)");
legend("Sine Input", "Control Response", "location", "southwest");