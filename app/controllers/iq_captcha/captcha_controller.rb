require_dependency "iq_captcha/application_controller"


module IqCaptcha

  class CaptchaController < ApplicationController
	def index	    
	    captcha = Captcha.new(params[:pointsize],params[:color_code])
	    question, answer = captcha.generate_question_answer
	    captcha = captcha.generate_captcha(question)
	    session[:iq_captcha_answer] = answer
	    send_data captcha.to_blob, :stream => 'false', :filename => 'captcha.jpg', :type => 'image/jpeg', :disposition => 'inline'	
	end
  end
end
