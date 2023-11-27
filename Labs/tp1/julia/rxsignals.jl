using MAT

ff = matopen("rxsignal_withchannelandfreqoff.mat");
@read ff rxs3;

using FFTW

rxs3X = reshape(rxs3, length(rxs3), 1)
rxs3_t = 10*log10.(abs2.(ifft(fft(rxs3X))));

# Function to plot the real and imaginary parts of a complex time series
function plot_complex_time_series(time_series)
    num_time_points = size(time_series, 2)
    
    # Plot the real part
    plot(1:num_time_points, real.(time_series[1, :]), label="Real", xlabel="Time", ylabel="Value", legend=:topleft)
    
    # Plot the imaginary part
    plot!(1:num_time_points, imag.(time_series[1, :]), label="Imaginary", linestyle=:dash)
    
    title!("Real and Imaginary Parts of Complex Time Series")
end

using Plots

# Plot the transposed complex time series to see some data
plot_complex_time_series(rxs3_t')


function fftshift(mat)
    dims = size(mat)
    halflen = div.(dims, 2)
    return circshift(mat, halflen)
end

rxs3_t_shift = 10*log10.(abs2.(fftshift(fft(rxs3_t))))
# plot_complex_time_series(rxs3_t_shift')

gui() 
