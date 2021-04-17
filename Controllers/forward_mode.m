eq = 0.3;   % linearization point

figure(1);
plot(step.Time, step.Data + eq, '--'); hold on;
plot(step_response.Time, step_response.Data + eq); grid on;
title("Forward Mode Latitude Controller Response to Step Input");
xlabel("Time (s)");
ylabel("Speed (m/s)");
legend("Step Input", "Control Response", "location", "southeast");