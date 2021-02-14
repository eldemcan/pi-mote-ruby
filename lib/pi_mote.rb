require 'rpi_gpio'
require 'pi_mote/version'

module PiMote
  class Sockets
    ON_SIGNALS = {
      0 => %w(high high low high),
      1 => %w(high high high high),
      2 => %w(low high high high),
      3 => %w(high low high high),
      4 => %w(low low high high)
    }.freeze

    OFF_SIGNALS = {
      0 => %w(high high low low),
      1 => %w(high high high low),
      2 => %w(low high high low),
      3 => %w(high low high low),
      4 => %w(low low high low)
    }.freeze

    # Pin numbers in this method comes from energenie manual
    def initialize(given_opt = {})
      @opt = {
        signal_pins: [17, 22, 23, 27],
        on_off_pin: 24,
        enable_pin: 25,
        board_numbering: :bcm
      }

      @opt = @opt.merge(given_opt) if defined? given_opt
      RPi::GPIO.set_numbering @opt[:board_numbering]

      @opt[:signal_pins].map do |pin|
        RPi::GPIO.setup pin, as: :output, initialize: :low
      end
      RPi::GPIO.setup @opt[:on_off_pin], as: :output, initialize: :low
      RPi::GPIO.setup @opt[:enable_pin], as: :output, initialize: :low
    end

    def change_plug_state(socket, signals_hash)
      socket_signals = signals_hash[socket]
      @opt[:signal_pins].zip(socket_signals).each do |pin, signal|
        RPi::GPIO.send("set_#{signal}", pin)
      end
      sleep(0.1)
      RPi::GPIO.set_high @opt[:enable_pin]
      sleep(0.25)
      RPi::GPIO.set_low @opt[:enable_pin]
    end

    def switch_on(socket = 0)
      change_plug_state(socket, ON_SIGNALS)
    end

    def switch_off(socket = 0)
      change_plug_state(socket, OFF_SIGNALS)
    end

    def cleanup
      @opt[:signal_pins].each { |pin| RPi::GPIO.clean_up pin }
      RPi::GPIO.clean_up @opt[:enable_pin]
      RPi::GPIO.clean_up @opt[:on_off_pin]
    end
  end
end
