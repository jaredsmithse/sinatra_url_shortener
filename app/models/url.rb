class Url < ActiveRecord::Base
  before_save :validate_url
  def clicked!
    self.click_count += 1
    self.save
  end


  def validate_url
    unless full_url.match(/http[s]{0,1}:\/\/.*/)
      self.full_url = "http://" + self.full_url
    end
  end
end
