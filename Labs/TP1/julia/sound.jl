# https://web.eecs.umich.edu/~fessler/course/100/lab/lab1.pdf
using HTTP
using FileIO: load
using Sound: sound
using Plots
url = "https://web.eecs.umich.edu/~fessler/course/100/misc/train-whistle.wav"
(y, S, _, _) = load(HTTP.URI(url))
sound(y, S)
