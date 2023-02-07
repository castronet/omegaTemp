# omegaTemp
This project was created to obtain temperature from a sensor and send it to your own influxDB.


## My choices are
* As a core (CPU/network/power) I'm using an [Onion Omega 2+](https://onion.io/omega2/)
* The sensor chosen is [BME280](https://store.ncd.io/product/bme280-digital-humidity-%c2%b13rh-pressure-and-temperature-sensor-i2c-mini-module/)
* Scripting languages: bash and Python
* Python script: [BME280.py](https://github.com/ControlEverythingCommunity/BME280/blob/master/Onion_Omega_Python/BME280.py) (also included in this repo)


## Software requirements
* Python
* curl
* bzip2
* sh
* awk
* Out of this scope: Your own and reachable Influxdb server.

### Install requirements
```
opkg update
opkg install python-light
opkg install pyOnionI2C
opkg install curl
```

## How to run the project?

1. Configure Onion Omega to connect to your network/Internet.
1. Install required software if missing.
1. Place this code on your Onion Omega disk.
1. Place your configuration to the files.
1. Configure `crontab` to execute `save_data.sh`.
1. Configure `crontab` to execute `send_data.sh`. You can set this script every hour for few battery usage.


### Crontab example
You can edit the crontab with `crontab -e` command.

```
*/1 * * * * /path/to/script/save_data.sh
*/15 * * * * /path/to/script/send_data.sh
```

## What I expect from the project
* Have my own sensors and my own data server to protect my privacy and the rights over my data.
* A way to filter this sensor from other sensors.
* Battery usage is not solved, it is planned to use all time AC power.



Enjoy the project :)
I has a great results if you render the data in Grafana.
