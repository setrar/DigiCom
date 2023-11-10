# UHD

- [ ] [USRP Hardware Driver and USRP Manual](https://files.ettus.com/manual/page_uhd.html)


  - [ ] [page_usrp_b200.html](https://files.ettus.com/manual/page_usrp_b200.html)
  
  - [ ] Identify device

```
uhd_find_devices
```
> Returns:
<pre>
[INFO] [UHD] Mac OS; Clang version 15.0.0 (clang-1500.0.40.1); Boost_107100; UHD_3.15.0.0-MacPorts-Release
[INFO] [B200] Loading firmware image: /opt/local/share/uhd/images/usrp_b200_fw.hex...
--------------------------------------------------
-- UHD Device 0
--------------------------------------------------
Device Address:
    serial: 30C51C1
    name: B200mini
    product: B200mini
    type: b200

</pre>


---

- [ ] [USRP B200 (Board Only)](https://www.ettus.com/all-products/ub200-kit/)
- [ ] [USRP B200 - Datasheet](https://www.ettus.com/wp-content/uploads/2019/01/b200-b210_spec_sheet.pdf)
  - 1 TX & 1 RX, Half or Full Duplex [AD9364]
  - [Xilinx Spartan 6 XC6SLX75 FPGA](https://www.xilinx.com/products/silicon-devices/fpga/spartan-6.html)
  - Up to 56 MHz of instantaneous bandwidth
  - USB Bus powered
  
  - RF coverage from 70 MHz – 6 GHz
  - GNU Radio, C++ and Python APIs
  - USB 3.0 SuperSpeed interface
  - Standard-B USB 3.0 connector
  - Flexible rate 12 bit ADC/DAC
  - Grounded mounting holes

- [ ] [AD9364: 1 x 1 RF Agile Transceiver](https://www.analog.com/en/products/ad9364.html)
- [ ] [AD9364: Datasheet](https://www.analog.com/media/en/technical-documentation/data-sheets/AD9364.pdf)
  - RF 1 × 1 transceiver with integrated 12-bit DACs and ADCs
  - Band: 70 MHz to 6.0 GHz
  - Supports TDD and FDD operation
  - Tunable channel bandwidth: <200 kHz to 56 MHz
  - Dual receivers: 6 differential or 12 single-ended inputs

# References

- [ ] Install [MacPorts](https://www.macports.org) for :apple:

- Download Ports binary [package](https://github.com/macports/macports-base/releases/download/v2.8.1/MacPorts-2.8.1-14-Sonoma.pkg)
- Installl the package
- Update the `~/.zshrc`  to include PATH linked to `/opt/local/bin` [(1)](https://superuser.com/questions/287713/sudo-port-command-not-found-after-installing-macports-on-snow-leopard)

#### :o: Installation

- [ ] [The Core Values of the Xilinx Spartan 6 XC6SLX75 FPGA](https://ebics.net/xilinx-spartan-6-xc6slx75/)

  - [ ] [Install](https://files.ettus.com/manual/page_install.html) UHD on :apple:
  
  ```
  sudo port install uhd
  ```
  > Returns:
```powershell
--->  Fetching archive for uhd
--->  Attempting to fetch uhd-3.15.0.0_7+docs+examples+libusb+manpages+manual+python310+python_api+test.darwin_23.arm64.tbz2 from https://packages.macports.org/uhd
--->  Attempting to fetch uhd-3.15.0.0_7+docs+examples+libusb+manpages+manual+python310+python_api+test.darwin_23.arm64.tbz2 from https://fra.de.packages.macports.org/uhd
--->  Attempting to fetch uhd-3.15.0.0_7+docs+examples+libusb+manpages+manual+python310+python_api+test.darwin_23.arm64.tbz2 from https://mse.uk.packages.macports.org/uhd
--->  Fetching distfiles for uhd
--->  Attempting to fetch uhd-3.15.0.0.tar.gz from https://distfiles.macports.org/uhd
--->  Verifying checksums for uhd                                                
--->  Extracting uhd
--->  Applying patches to uhd
--->  Configuring uhd
--->  Building uhd                                       
--->  Staging uhd into destroot                          
--->  Installing uhd @3.15.0.0_7+docs+examples+libusb+manpages+manual+python310+python_api+test
--->  Activating uhd @3.15.0.0_7+docs+examples+libusb+manpages+manual+python310+python_api+test
--->  Cleaning uhd
--->  Updating database of binaries
--->  Scanning binaries for linking errors
--->  No broken files found.
--->  No broken ports found.
--->  Some of the ports you installed have notes:
  db48 has the following notes:
    The Java and Tcl bindings are now provided by the db48-java and
    db48-tcl subports.
  libpsl has the following notes:
    libpsl API documentation is provided by the port 'libpsl-docs'.
  lzma has the following notes:
    The LZMA SDK program is installed as "lzma_alone", to avoid conflict with
    LZMA Utils
  py310-cython has the following notes:
    To make the Python 3.10 version of Cython the one that is run when you
    execute the commands without a version suffix, e.g. 'cython', run:
    
    port select --set cython cython310
  py310-docutils has the following notes:
    To make the Python 3.10 version of docutils the one that is run when you
    execute the commands without a version suffix, e.g. 'rst2man', run:
    
    port select --set docutils py310-docutils
  python310 has the following notes:
    To make this the default Python or Python 3 (i.e., the version run by the
    'python' or 'python3' commands), run one or both of:
    
        sudo port select --set python python310
        sudo port select --set python3 python310
  python311 has the following notes:
    To make this the default Python or Python 3 (i.e., the version run by the
    'python' or 'python3' commands), run one or both of:
    
        sudo port select --set python python311
        sudo port select --set python3 python311
```
