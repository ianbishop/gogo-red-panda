class Repeater
	@@subscribers = []

	def subscribe newSubscriber
		@@subscribers << newSubscriber
	end

	def broadcast message
		@@subscribers.each {|subscriber| subscriber.accept(message)}
	end
end