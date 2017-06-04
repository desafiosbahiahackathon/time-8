# login required controller for test of token authentication
class TeamsController < ApplicationController
  before_action :require_login

  def index
    render json: { teams: 'List of CBLOL teams' }
  end
end