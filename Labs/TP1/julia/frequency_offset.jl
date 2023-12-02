using LinearAlgebra
# using Metal
# using FourierTools

using MAT
using FFTW  # Import the FFTW library for fast Fourier transform
using DSP

# m2_chan = 10*log10(abs(conv(rxs2,conj(fliplr(pss2_t))))); [c2_chan,Nf2_chan] = max(m2_chan);
# https://stackoverflow.com/questions/57169773/convolution-of-complex-vectors


include("rxsignal_withchannelandfreqoff.jl")
include("pss2.jl")

pss2_t = ifft(pss_2')
pss2_t /= norm(pss2_t)
# pss2_t = [pss2_t[2048 - 143:end]; pss2_t]
# pss2_t_tmp = []
# pss2_t_tmp = [pss2_t_tmp ; pss2_t[end - 143:end] ]
# pss2_t_tmp = [pss2_t_tmp ; pss2_t]

# pss2_t = pss2_t_tmp

# Direct colvolution https://github.com/JuliaDSP/DSP.jl/issues/292
function directconv(A::AbstractArray{<:Any,M}, B::AbstractArray{<:Any,N}) where {M,N}
    axes_A = ntuple(i -> axes(A, i), Val(max(M,N)))
    axes_B = ntuple(i -> axes(B, i), Val(max(M,N)))
    krange(i) = CartesianIndices((:).(max.(first.(axes_B), Tuple(i) .- last.(axes_A)), min.(last.(axes_B), Tuple(i) .- first.(axes_A))))
    return [sum(A[i-k]*B[k] for k in krange(i)) for i in CartesianIndices((:).(first.(axes_A).+first.(axes_B), last.(axes_A).+last.(axes_B)))]
end

# Perform convolution
println("reverse(A,dims=2)")
rev_pss2_t = reverse(pss2_t)

println("conj");
conj_pss2_t = conj(rev_pss2_t)


println("conv");
# conv_rxs3_pss2_t = DSP.conv(rxs3, conj_pss2_t)
conv_rxs3_pss2_t = directconv(rxs3, conj_pss2_t)


println("log");
# m2_chan = 10 * log10.(abs(conv_rxs3_pss2_t))
