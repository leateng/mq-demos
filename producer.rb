require 'bunny'

conn = Bunny.new "amqp://guest:guest@localhost:5672/CRM"
conn.start

ch = conn.create_channel
# x = ch.default_exchange
x = ch.exchange("alert", type: "direct", durable: true)

x.publish "hello alert111", routing_key: "alert1"
x.publish "hello alert222", routing_key: "alert2"

conn.close
