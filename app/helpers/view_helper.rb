module ViewHelper
	include GlobalConstants
	def mobile_device?
	     request.user_agent =~ /Mobile|webOS/
	end
	def get_not_available_message
		GlobalConstants::NOT_AVAILABLE
	end	
		
	def get_value_to_show(field)
		if field.blank?
			return get_not_available_message
		else
			return field
		end		
	end	
	def disable_nav(header=false,footer=false)
		if header==true
			@disable_nav_header=true
		end
		if footer==true
			@disable_nav_footer=true
		end
	end	 
	#used to show the title of the html page
	 def title(page_title)
	  if page_title.to_s==""
	   content_for(:title) { h(GlobalConstants::SITE_NAME) }
	  else
	   content_for(:title) { h(page_title.to_s) }
	  end
	 end 

	 def truncate_preview_title(title)
	  truncate(title, length: 65)
	 end
	 def truncate_preview_description(desc)
	  truncate(desc, length: 160)
	 end
	 def render_user_image_or_provide_default(image_url)
	 	if image_url.nil? or image_url.empty?
	 		return image_url('default_user.png')
	 	else
	 		return image_url	
	 	end	
	 end	
	 def return_csv_data_from_proprty_of_object(object,fields)
	 	csv=" "
	 	if !object.nil? and !fields.nil? and fields.size>0
	 		fields.each do |field|
	 			csv=csv+object.read_attribute(field)+","
	 		end
	 	end	
	 	return csv.chop!		
	 end	
end