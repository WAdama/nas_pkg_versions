# nas_pkg_versions
Bash script for PRTG by Paessler to monitoring status of device backup in Synology Active Backup for Business

The sensor will show the status of the last backup, how many data were transferred, the duration and the time passed since the laste backup. nas_ab_status_m.sh is for multiple devices in one sensor.

Sensor has to be created in PRTG on your Synology device.

Sensor tested on DS 918+ & DS 420+ with DSM 7.0.1-42218 and DS 413 with DSM 6.2.4-25556-2

### Prerequisites

Be sure you have set correct logon values for SSH in your device.

I personally use "Login via private key" with an user especially for monitoring which also may use sudo for this script without a password.

![Screenshot1](./images/ssh_settings.png)

**HINT:** Since DSM 6.2.2 for SSH access the user has to be member of the local Administrators group on your Synology NAS.

### Installing
