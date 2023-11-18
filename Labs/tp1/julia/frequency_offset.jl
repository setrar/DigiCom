using MAT
# using FFTW  # Import the FFTW library for fast Fourier transform
# using DSP
 using LinearAlgebra
# using Metal
using FourierTools

# m2_chan = 10*log10(abs(conv(rxs2,conj(fliplr(pss2_t))))); [c2_chan,Nf2_chan] = max(m2_chan);


include("rxsignal_withchannelandfreqoff.jl")
include("pss2.jl")

pss2_t = ifft(pss_2')
pss2_t /= norm(pss2_t)
# pss2_t = [pss2_t[2048 - 143:end]; pss2_t]

# Perform convolution
println("reverse(A,dims=2)")
rev_pss2_t = reverse(pss2_t,dims=2)

println("conj");
conj_pss2_t = conj(rev_pss2_t)


println("conv");
conv_rxs3_pss2_t = conv(rxs3, conj_pss2_t)


println("log");
m2_chan = 10 * log10.(abs(conv_rxs3_pss2_t))
