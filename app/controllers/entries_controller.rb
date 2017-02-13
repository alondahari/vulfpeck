class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end

  def new
    @entry = Entry.new
  end

  def create
    entry_params = params.require('entry').permit('name', 'email', 'entry')
    if entry_params['name'] == '' || entry_params['email'] == '' || entry_params['entry'] == ''
      redirect_to '/', notice: 'Please fill all fields'
    else
      entry = Entry.create(entry_params)
      redirect_to '/leaderboard'
    end
  end

end
