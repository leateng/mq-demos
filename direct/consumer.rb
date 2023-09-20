require 'bunny'

conn = Bunny.new "amqp://guest:guest@localhost:5672/CRM"
conn.start
ch = conn.create_channel
ch.prefetch(2)
q = ch.queue("alert-qu1")
q.bind("alert", routing_key: "alert1")

# 主动读
# m = q.get

# 推送
# subscribe 方法会阻塞当前线程
q.subscribe(block: true) do |_delivery_info, _properties, body|
 #  puts "# Received Message: #{body}"
	# puts " _delivery_info: #{_delivery_info}"
	# puts " _properties: #{_properties}"
	puts " body: #{body}"
end
