class MessagesController < ApplicationController
	def new
		@message = Message.new
    @user = params[:fname]
	end

	def create
    @message = Message.new message_params

    if @message.valid?
    	MessageMailer.become_coach(@message).deliver_now
      redirect_to root_url, notice: "Votre demande pour devenir coach à bien était reçu, nous vous recontacterons bientôt !"
    else
      render :new
    end
	end

	 private

  	def message_params
    	params.require(:message).permit(:fname, :phone, :email, :body)
  	end
end
