class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end

  def new
    @entry = Entry.new
  end

  def create
    entry_params = params.require('entry').permit('name', 'email', 'entry')
    logger.info entry_params
    entry = Entry.create(entry_params)
    redirect_to '/leaderboard'
  end

end
