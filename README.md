= IqCaptcha

<h1>Prerequisites package:</h1><br />
ubuntu 10.04, sudo apt-get install libmagickwand-dev <br />
ubuntu 11.04, sudo apt-get install libmagick9-dev<br />
ubuntu 12.04, sudo apt-get install graphicsmagick-libmagick-dev-compat<br />
CentOS, yum install ImageMagick-devel<br />
Mac, brew install imagemagick<br />

Pre requisite <strong>gem rmagick</strong><br />

<h1>Installation:</h1>
1. Place captcha background image named(iq_captcha_background.png) in your project's public folder<br />
2. in Gemfile, gem 'iq_captcha' and run bundle install<br />
3. in routes.rb, mount IqCaptcha::Engine, :at => '/iq_captcha' <br />

4. Now browse for testing, for exaample, http://localhost:3000/iq_captcha, if the captcha comes then it is OK for the test<br />

5. to use the captcha in your project's view <br />
&lt;img src="/iq_captcha?t=<%= Time.now.to_i %>&pointsize=25&color_code=ffffff"> &lt;input type="text" name="iq_captcha_result" /&gt;<br />

6. in controller,<br />
 <code>
 if Captcha::valid?(session,params)
  # You are human being
 else
   # You are not human
 end
 </code>

7. You are Done


This project rocks and uses MIT-LICENSE.