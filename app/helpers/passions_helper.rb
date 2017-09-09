module PassionsHelper

  def choose_cover_image(passion)
    name = passion.category.name.downcase
    case name
    when 'programming'
      asset_path 'programming.jpg'
    when 'dancing'
      asset_path 'salsa.jpg'
    when 'boxing'
      asset_path 'boxing.jpg'
    when 'photography'
      asset_path 'photography.jpg'
    when 'qajava'
      asset_path 'programming.jpg'
    end
  end
end
