class SendTextController < ApplicationController

	#frequency of a customer is determine by having more than 5 orders
	def send_text_message
		@numbers = Orders.all
		@phone_num = @numbers.phonenum.all
		@frequentcustomers = @phonenum.select{|element| @phone_num.count(element) > 5 }
		#each orders are group together
		@group = @frequentcustomers.group_by{|array| array.sort}.values
		@group.each do |x|
				@num = x.phonenum
				@dup = @num.select{|element| @num.count(element) >1}
				@send_text_message = @dup.uniq
				#list of recepients for the alert
				@send_text_message.each do |n|
				@numbers_to_send_to = n 
			end
		#most frequent product purchased per user 
			@y = x.order_items
			@products = y.products
			@frequent = @products.select{|element| y.count(element) > 3 }
			@fav_product = @frequent.uniq
			
		end

	 

	
    number_to_send_to = @numbers_to_send_to
 
    twilio_sid = 'AC11b0d32fecdff690ceeac45200e8e92c' 
	twilio_token = 'b7f794646441cf8d9598cd3d1ae1241b'
    twilio_phone_number = "13312085205"
 
    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
 
    @twilio_client.account.ssmessages.create(
      :from => "+1#{twilio_phone_number}",
      :to => @numbers_to_send_to,
      :body => "Hi there, your favourite #{@fav_product} is available to be purchased at Teszo")
  end
end


array = [1, 2, 1, 3, 5, 4, 5, 5]
=> [1, 2, 1, 3, 5, 4, 5, 5]
dup = array.select{|element| array.count(element) > 1 }
=> [1, 1, 5, 5, 5]
dup.uniq
=> [1, 5]