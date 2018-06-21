class MesagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @mesages = @conversation.mesages
    if @mesages.length > 10
      @over_ten = true
      @mesages = @mesages[-10..-1]
    end
    if params[:m]
      @over_ten = false
      @mesages = @conversation.mesages
    end
    if @mesages.last
      if @mesages.last.user_id != current_user.id
        @mesages.last.read = true;
      end
    end
    @mesage = @conversation.mesages.new
  end

  def new
    @mesage = @conversation.mesages.new
  end

  def create
    @mesage = @conversation.mesages.new(mesage_params)
      if @mesage.save
        redirect_to conversation_mesages_path(@conversation)
      end
  end

private
  def mesage_params
    params.require(:mesage).permit(:body, :user_id)
  end
end