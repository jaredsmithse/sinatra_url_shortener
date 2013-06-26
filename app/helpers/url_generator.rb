helpers do
  def generate_short_url(args)
    args[:short_url] = SecureRandom.base64(6).gsub("+","_")
    args[:click_count] = 0
    args
  end
end