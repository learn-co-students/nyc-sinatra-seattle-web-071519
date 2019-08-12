class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end
  
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end
  
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    @my_titles = @figure.titles
    @my_landmarks = @figure.landmarks
    erb :'figures/edit'
  end

  post '/figures' do
    @banana = Figure.new(name:params[:figure][:name])
    @banana.landmark_already_made(params)
    @banana.landmark_not_made(params)
    @banana.title_already_made(params)
    @banana.title_not_made(params)
    @banana.save
    redirect "/figures/#{@banana.id}"
  end

  patch '/figures/:id' do
    @banana = Figure.find(params[:id])
    @banana.update(name:params[:figure][:name])
    @banana.landmark_already_made(params)
    @banana.landmark_not_made(params)
    @banana.title_already_made(params)
    @banana.title_not_made(params)
    @banana.save
    # byebug
    redirect "/figures/#{@banana.id}"
  end


end
