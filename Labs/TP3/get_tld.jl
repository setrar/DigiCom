function get_tdl(fs, SCS, PRBS, DS, chan)
    # Check the type of channel
    if chan == "tdlc"
        coef_start = 1
        # TDL-C channel coefficients
        tdl = [1 0 -4.4;
               2 0.2099 -1.2;
               # ... (additional coefficients)
               24 8.6523 -22.8]
    elseif chan == "tdld"
        coef_start = 2
        # TDL-D channel coefficients
        tdl = [1 0 -.00147;
               2 0.035 -18.8;
               # ... (additional coefficients)
               13 12.525 -27.7]
    else
        error("unknown channel $chan")
    end

    # Compute the normalization factor for channel coefficients
    tdl_norm = sum(10 .^(0.1 * tdl[coef_start:end, 3]))

    # Generate frequency grid for the channel
    PRB = 1:12
    fgrid = []
    for PRBs in PRBS
        append!(fgrid, SCS * ((PRBs * 12) .+ PRB))
    end

    # compute channel impulse response
    Htdl = [
        exp.(-im * 2 * π * f * tdl[coef_start:end, 2] * DS) .* sqrt.(10 .^(0.1 * tdl[coef_start:end, 3]))
        for f in fgrid
    ]

    # Generate random complex gains for each channel tap
    gv = (√(0.5) * randn(length(tdl[coef_start:end, 2])) + im * √(0.5) * randn(length(tdl[coef_start:end, 2])))'

    # Combine channel response and gains
    H = Htdl * gv / sqrt(tdl_norm)

    # Add mean for Ricean channel
    if coef_start == 2
        H += exp(-im * 2 * π * f * tdl[1, 2] * DS) .* √(10 .^(0.1 * tdl[1, 3]))' / √(tdl_norm)
    end

    return H
end