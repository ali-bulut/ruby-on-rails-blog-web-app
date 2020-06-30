module PortfoliosHelper
  def image_generator(height, width)
    "https://via.placeholder.com/#{height}x#{width}"
  end

  def portfolio_img(img, type)
    if img
      img
    elsif type == "thumb"
      image_generator("350", "200")
    else
      image_generator("600", "400")
    end
  end
end