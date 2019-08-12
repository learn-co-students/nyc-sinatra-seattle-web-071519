require 'pry'

class Figure < ActiveRecord::Base
  # add relationships here
  has_many :figure_titles
  has_many :landmarks
  has_many :titles, through: :figure_titles

  def landmark_already_made(params)
    # binding.pry
    if params[:figure].has_key?(:landmark_ids)
      my_landmarks = params[:figure][:landmark_ids].map do |landmark_id|
        lmid= landmark_id.to_i
        Landmark.all.find(lmid)
      end
      my_landmarks.each do |landmark|
        if !self.landmarks.include?(landmark)
          self.landmarks << landmark
        end
      end
    end
  end

  def landmark_not_made(params)
    # binding.pry
    if !params[:landmark][:name].empty?
      landmarky = Landmark.new(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
      self.landmarks << landmarky
    end
  end

  def title_already_made(params)
    if params[:figure].has_key?(:title_ids)
      my_titles = params[:figure][:title_ids].map do |title_id|
        tid= title_id.to_i
        Title.all.find(tid)
      end

      my_titles.each do |title|
        if !self.titles.include?(title)
          self.titles << title
        end
      end
    end
  end

  def title_not_made(params)
    if !params[:title][:name].empty?
      titley = Title.new(name: params[:title][:name])
      self.titles << titley
    end
  end

end
