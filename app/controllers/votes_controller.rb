class VotesController < ApplicationController
  def new
  end

  def create
    @vote = votes_params
    vote_json = {
      first_name: @vote[:first_name],
      last_name: @vote[:last_name],
      birth_date: @vote[:bdate],
      vote: !@vote[:yes_no].to_i.zero?
    }


    $kafka_producer.produce(vote_json.to_json, topic: APP_CONFIG["KAFKA_VOTES_TOPIC"])
    begin
      $kafka_producer.deliver_messages
    rescue Kafka::Error
      flash[:danger] = "Something went wrong. Please try again later!"
      respond_to do |format|
       format.html { redirect_to root_url }
      end
      return
    end
    flash[:success] = "Congratulations!"
    respond_to do |format|
     format.html { render :new }
    end
  end

  private

  def votes_params
    params.permit(:first_name, :last_name, :bdate, :yes_no)
  end

end
