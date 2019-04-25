class VotesController < ApplicationController
  def new
  end

  def create
    @vote = votes_params
    kafka_json = {
      first_name: @vote[:first_name],
      last_name: @vote[:last_name],
      birth_date: @vote[:bdate],
      vote: !@vote[:yes_no].to_i.zero?
    }
    debugger
  end


  private

  def votes_params
    params.permit(:first_name, :last_name, :bdate, :yes_no)
  end
end
