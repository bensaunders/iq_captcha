require 'RMagick'
include Magick

class Captcha
  attr_accessor :pointsize, :color_code
  OPERATORS = ['+','-','*','/','minute','hour','day','week','month','year'].shuffle
  MAX_OP = 4
  MIN_OP = 4
  def initialize(pointsize=25,color_code='ffffff')
	self.pointsize = pointsize.to_i
	self.pointsize = 25 if self.pointsize.to_i == 0
	self.color_code = color_code
	self.color_code = 'ffffff' if !self.color_code.present?
  end

  def generate_captcha(text_on_captcha='default')
    color_code = self.color_code
    pointsize = self.pointsize
    img = ImageList.new("public/iq_captcha_background.png")
    txt = Draw.new
    img.annotate(txt, 0,0,0,0, "#{text_on_captcha}"){
      txt.gravity = Magick::SouthGravity
      txt.pointsize = pointsize
      txt.stroke = '#000000'
      txt.fill = '#' + color_code
      txt.font_weight = Magick::BoldWeight
    }
    img.format = 'jpeg'
    return img
  end

  def generate_question_answer
    op1 = rand(Captcha::MAX_OP)
    op2 = 1 + rand(Captcha::MIN_OP)
    operator = Captcha::OPERATORS[rand(Captcha::OPERATORS.size)]
    case operator
	when '+','-','*','/'
          answer = eval("#{op1}#{operator}#{op2}")
          question = "#{op1}#{operator}#{op2} = ?"
	when 'minute'
	  op1 = 1 if op1 == 0
          answer = eval("#{op1.minute/1.second}")
          question = "#{op1} minutes = ? seconds"	  
	when 'hour'
          op1 = 1 if op1 == 0
          answer = eval("#{op1.hour/1.minute}")
          question = "#{op1} hours = ? minutes"
	when 'day'
          op1 = 1 if op1 == 0
          answer = eval("#{op1.day/1.hour}")
          question = "#{op1} days = ? hours"
	when 'week'
          op1 = 1 if op1 == 0
          answer = eval("#{op1.week/1.day}")
          question = "#{op1} weeks = ? days"
	when 'month'
          op1 = 1 if op1 == 0
          answer = eval("#{op1.month/1.day}")
          question = "#{op1} months = ? days"
	when 'year'
          op1 = 1 if op1 == 0
          answer = eval("#{op1.year/1.month}").to_i
          question = "#{op1} years = ? months"

	else
          answer = eval("#{op1}+#{op2}")
          question = "#{op1}+#{op2} = ?"	
    end
    return  question, answer
  end

  def self.valid?(session,params)
    return params[:iq_captcha_result] && (session[:iq_captcha_answer].to_i == params[:iq_captcha_result].to_i)
  end

end

