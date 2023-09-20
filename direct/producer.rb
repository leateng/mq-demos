require 'bunny'

conn = Bunny.new "amqp://guest:guest@localhost:5672/CRM"
conn.start

ch = conn.create_channel
# x = ch.default_exchange
x = ch.exchange("notification", type: "direct", durable: true)
x.publish "hello alert", routing_key: "alert"

conn.close
