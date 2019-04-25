class VotesController < ApplicationController
  include VotesHelper
  def new
  end

  def create
    # gathering data from params
    @vote = votes_params
    # validating the data
    if !@vote[:first_name].present? || !@vote[:first_name].present? || !@vote[:bdate]
      redirect_to_root_with_msg "All fields are required!"
      return
    end

    unless is_allowed_age(@vote[:bdate])
       redirect_to_root_with_msg "Unfortantely, you are not meeting the appropriate voting age!"
       return
    end

    vote_json = {
      first_name: @vote[:first_name],
      last_name: @vote[:last_name],
      birth_date: @vote[:bdate], # the date in iso format already
      vote: !@vote[:yes_no].to_i.zero? # true or false boolean
    }

    # sending the vote to kafka through the product API
    $kafka_producer.produce(vote_json.to_json, topic: APP_CONFIG["KAFKA_VOTES_TOPIC"])


    begin
      $kafka_producer.deliver_messages
    rescue Kafka::Error
      redirect_to_root_with_msg "Something went wrong. Please try again later!"
      return
    end

    flash[:success] = "Congratulations!"
    respond_to do |format|
     format.html { render :congratulations }
    end
  end


  def congratulations

  end

  private

  def votes_params
    params.permit(:first_name, :last_name, :bdate, :yes_no)
  end

end
