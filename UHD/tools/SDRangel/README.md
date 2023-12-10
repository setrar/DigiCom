# SDRangle

### Using an UHD Device &#x1F4DF;

- [ ] Add environment variables to locate the UHD images for FPGA Flashing

```zsh
export UHD_HOME=/opt/local/share/uhd; \
export UHD_IMAGES_DIR=$UHD_HOME/images
```

- [ ] Run SDRangel

```
SDRangel
```

##### WebAPI http://localhost:8091

| | |
|-|-|
| <img src=images/SDRangle-portal.png width='' height=''> </img> | <img src=images/SDRangle-Swagger.png width='' height=''> </img> |

```
curl -X GET "http://localhost:8091/sdrangel" -H  "accept: application/json" | jq '.'
```
> Returns
```json
{
  "appname": "SDRangel",
  "architecture": "arm64",
  "devicesetlist": {
    "deviceSets": [
      {
        "channelcount": 0,
        "samplingDevice": {
          "bandwidth": 3000000,
          "centerFrequency": 435000000,
          "deviceNbStreams": 1,
          "deviceStreamIndex": 0,
          "direction": 0,
          "hwType": "USRP",
          "index": 0,
          "sequence": 0,
          "serial": "type=b200,name=lab1_xcvr,serial=30C51C1,product=B200mini",
          "state": "idle"
        }
      }
    ],
    "devicesetcount": 1,
    "devicesetfocus": 0
  },
  "dspRxBits": 24,
  "dspTxBits": 16,
  "featureset": {
    "featurecount": 0
  },
  "logging": {
    "consoleLevel": "debug",
    "dumpToFile": 0
  },
  "os": "macOS 14.1",
  "pid": 69812,
  "qtVersion": "5.15.11",
  "version": "7.13.0"
}
```

- [ ] 	&#x1F4E6; Install on Apple &#x1F34E;

```zsh
sudo port install SDRangel
```

```
which SDRangel
```
<pre>
/opt/local/bin/SDRangel
MainSettings::MainSettings: settings file: format: 0 location: ~/Library/Preferences/com.f4exb.SDRangel.plist
</pre>

# References

- [ ] [SDRangel.org](https://www.sdrangel.org/)
