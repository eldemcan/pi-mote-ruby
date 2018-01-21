# Pi Mote ruby
Energenie Pi-mote ruby api for Raspberry Pi. 
# Dependency 
You need to install [pi piper](https://github.com/jwhitehorn/pi_piper) library. 

# Example

```ruby
sc = PiMote.new
sc.switch_on(socket_number)
sc.switch_off(socket_number)

sc.switch_on # all sockets on
sc.switch_off # all sockets on
``` 
