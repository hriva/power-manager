# Objective
This utilities automatizes the energy handling in laptops without user interaction, for the 2 most common cases.
- Plugging and unplugging the laptop to the AC
- Changing the power profile during the session to handle the workload level the profile name suggests.

## Requirements
The use of these scripts requires `tuned-ppd` daemon to work.
Support for `powerprofilectl` might come latter.

## Install
```sh
sudo make install
```

### Uninstall
```sh
sudo make uninstall
```

## Troubleshoot
Check that the service started correctly and is working.
```
journalctl -u power-profiler.service -f
```

TODO:
- [ ] Add `powerprofilectl` as alternative.
- [ ] Delay init to allow fast session login.
