class FiguresController < ApplicationController
  
  
  get '/' do
    erb :index
  end
 
  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures/new' do
    @new_figure= Figure.create(params[:figure])
    if params[:title][:name] != ""
      @new_title = Title.create(params[:title])
      FigureTitle.create({:title_id => @new_title.id, :figure_id => @new_figure.id})
    end
    if params[:landmark][:name] != ""
      @new_landmark = Landmark.new
      @new_landmark.name = params[:landmark][:name]
      @new_landmark.year_completed = params[:landmark][:year]
      @new_landmark.figure_id = @new_figure.id
      @new_landmark.save
    end
  end





  # post '/edit' do
  # end











end
