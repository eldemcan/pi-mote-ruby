# Pi Mote ruby
Energenie [Pi-mote](https://energenie4u.co.uk/catalogue/product/ENER002-2PI) ruby api for Raspberry Pi.
# Dependency
You need to install [rpi gpio](https://github.com/ClockVapor/rpi_gpio) library.
If you encounter problems related with permissions you can change ownership of `/dev/gpiomem` folder with `sudo chown root.gpio /dev/gpiomem
sudo chmod g+rw /dev/gpiomem` chmod one will give write permissions.

# Example

```ruby
sc = PiMote.new
sc.switch_on(socket_number)
sc.switch_off(socket_number)

sc.switch_on # all sockets on
sc.switch_off # all sockets on
```
