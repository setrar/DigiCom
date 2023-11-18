# Wifi Connect


```
export UHD_IMAGES_DIR=/opt/local/share/uhd/images
```

```
jupyter lab
```

<img src=images/WIFI-card-status.png width='50%' height='50%' > </img>

# References

- [ ] [Wi-Fi Channels, Frequencies, Bands & Bandwidths](https://www.electronics-notes.com/articles/connectivity/wifi-ieee-802-11/channels-frequencies-bands-bandwidth.php)

***5 GHz WiFi channels & frequencies***

| CHANNEL NUMBER	| FREQUENCY MHZ	| EUROPE (ETSI)	| NORTH AMERICA (FCC)	| JAPAN |
|-----|-------|---------------------|-----|-----------|
| 60	| 5300	| Indoors / DFS / TPC	| DFS	| DFS / TPC | 
| 64	| 5320	| Indoors / DFS / TPC	| DFS	| DFS / TPC | 
| 100	| 5500	| DFS / TPC	| DFS	| DFS / TPC | 
| 104	| 5520	| DFS / TPC	| DFS	| DFS / TPC | 
| 108	| 5540	| DFS / TPC	| DFS	| DFS / TPC | 
| 112	| 5560	| DFS / TPC	| DFS	| DFS / TPC | 
| 116	| 5580	| DFS / TPC	| DFS	| DFS / TPC | 
| 120	| 5600	| DFS / TPC	| No Access	| DFS / TPC | 

- [ ] [Detecting the wifi signal power spectrum using USRP and Simulnik](https://www.mathworks.com/matlabcentral/answers/197123-detecting-the-wifi-signal-power-spectrum-using-usrp-and-simulnik)

You can tune it to a particular center frequency for a given channel.

USRP B210 offers 56 MHz of IBW in 1x1 configuration. In a 2x2 configuration it can offer upto 30 MHz of IBW., which may not be enough given the channel BW is 22 MHz. Its best to write your own spectrum estimation code and use MATLABs user defined blocks within Simulink to plot and estimate the signal BW. ADC sample rate (max) is 61.44 MSps.
