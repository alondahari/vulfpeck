class EntriesController < ApplicationController
  def index
    @entries = Entry.all.sort {|x, y| y[:votes] <=> x[:votes]}
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

  def upvote
    entry = Entry.find(params[:id])
    entry[:votes] = entry[:votes] + 1

    if entry.save
      render status: 200, json: ({new_votes: entry[:votes]}).to_json
    else
      render status: 500
    end
  end
end
