class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'landmarks/new'
  end
  
  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end
  
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  post '/landmarks' do
    @my_landmarks = Landmark.all.map do |landmark|
      landmark.name
    end

    if !@my_landmarks.include?(params[:landmark][:name])
    @banana = Landmark.new(name:params[:landmark][:name],year_completed: params[:landmark][:year_completed])
    @banana.save
    
  else 
    @banana = Landmark.find_by(name:params[:landmark][:name])
  end
    redirect "/landmarks/#{@banana.id}"

  end

  patch '/landmarks/:id' do
    @banana = Landmark.find(params[:id])
    @banana.update(name:params[:landmark][:name],year_completed: params[:landmark][:year_completed])
    @banana.save
    redirect "/landmarks/#{@banana.id}"
  end
end
