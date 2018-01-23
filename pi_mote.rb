require 'pi_piper'

class PiMote
  include PiPiper

  ON_SIGNALS = {
    0 => %i(on on off on),
    1 => %i(on on on on),
    2 => %i(off on on on),
    3 => %i(on off on on),
    4 => %i(off off on on)
  }.freeze

  OFF_SIGNALS = {
    0 => %i(on on off off),
    1 => %i(on on on off),
    2 => %i(off on on off),
    3 => %i(on off on off),
    4 => %i(off off on off)
  }.freeze

  # Pin numbers in this method comes from energenie manual
  def initialize(given_opt)
    opt = {
      signal_pins: [17, 22, 23, 27],
      on_pin: 24,
      off_pin: 25
    }

    opt.merge(opt) if defined? given_opt
    @signal_pins = opt[:signal_pins].map do |pin|
      PiPiper::Pin.new(pin: pin, direction: :out)
    end

    @on_off_pin = PiPiper::Pin.new(pin: opt[:on_pin], direction: :out)
    @enable_pin = PiPiper::Pin.new(pin: opt[:off_pin], direction: :out)

    @on_off_pin.off
    @enable_pin.off

    @signal_pins.map(&:off)
  end

  def change_plug_state(socket, signals_hash)
    socket_signals = signals_hash[socket]
    @signal_pins.zip(socket_signals).each { |pin, signal| pin.send(signal) }
    sleep(0.1)
    @enable_pin.on
    sleep(0.25)
    @enable_pin.off
  end

  def switch_on(socket = 0)
    change_plug_state(socket, ON_SIGNALS)
  end

  def switch_off(socket = 0)
    change_plug_state(socket, OFF_SIGNALS)
  end
end
