class JokesController < ApplicationController
  before_action :find_joke, only: [:like, :dislike]

  def show
    set_joke
  end

  def like
    @joke&.increment!(:like)
    cookies[:jokes] = cookies[:jokes].to_s + ",#{@joke.id}"
    set_joke
    respond_to do |format|
      format.js { render template: 'jokes/vote' }
    end
  end

  def dislike
    @joke&.increment!(:dislike)
    cookies[:jokes] = cookies[:jokes].to_s + ",#{@joke.id}"
    set_joke
    respond_to do |format|
      format.js { render template: 'jokes/vote' }
    end
  end

  private

  def find_joke
    @joke = Joke.find_by_id(params[:id])
  end

  def set_joke
    jokes_voted = cookies[:jokes].split(',').map(&:to_i) if cookies[:jokes]
    @joke = Joke.where.not(id: jokes_voted).first
  end
end
