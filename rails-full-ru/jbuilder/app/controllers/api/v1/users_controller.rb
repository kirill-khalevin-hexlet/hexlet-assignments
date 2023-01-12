# frozen_string_literal: true

class Api::V1::UsersController < Api::ApplicationController
  # BEGIN
  def index
    @users = User.all
    respond_to do |format|
      format.json
    end
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.json
    end
  end
  # END
end
