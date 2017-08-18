class SlackNotifyService 
	def initialize(message = "")
		@message = message 
	end 

	# def perform 
	# 	notifier = Slack::Notifier.new ENV["WEBHOOK_URL"] do 
	# 		defaults channel: ENV["NotifyChannel"], username: ENV["SlackUser"]
	# 	end 

	# 	notifier.ping @message unless @message.empty?
	# end 

end 