module BrandsHelper

  def price_visual(price_range)
    if price_range <= 50
      "$"    
      elsif price_range <= 100
        "$$"
      elsif price_range <= 150
        "$$$"
      elsif price_range <= 200
        "$$$$"
      else
        "$$$$$"     
    end 
  end 


  def description_display(speciality)
    if speciality.length <= 100
      speciality
    else
      speciality[0..100] + " ..."
    end 
  end 

end
