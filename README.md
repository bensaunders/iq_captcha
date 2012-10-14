= IqCaptcha

<h1>Prerequisite package:</h1>
ubuntu 10.04, sudo apt-get install libmagickwand-dev<br />
ubuntu 11.04, sudo apt-get install libmagick9-dev<br />
ubuntu 12.04, sudo apt-get install graphicsmagick-libmagick-dev-compat<br />
CentOS, yum install ImageMagick-devel<br />
Mac, brew install imagemagick<br />

Pre requisite <strong>gem rmagick</strong>

<h1>Installation:</h1>
<ul>
<li> Place captcha background image named(iq_captcha_background.png) in your project's public folder</li>
<li> in Gemfile, <code>gem 'iq_captcha' or gem 'iq_captcha', :git => 'git@github.com:barek2k2/iq_captcha.git' </code> and run <code>bundle install</code></li>
<li> in routes.rb, <code>mount IqCaptcha::Engine, :at => '/iq_captcha'</code> </li>

<li> Now restart your server and browse for testing, for exaample, <code>http://localhost:3000/iq_captcha</code>, if the captcha comes then it is OK for the test</li>

<li> To use the captcha in your project's view 
<pre><code>
&lt;img src="/iq_captcha?t=&lt;%= Time.now.to_i %&gt;&pointsize=25&color_code=ffffff"&gt;
&lt;input type="text" name="iq_captcha_result" /&gt;
</code></pre>

<li> In controller,
 <pre><code>
 if Captcha::valid?(session,params)
   # You are human being
 else
   # You are not human
 end
 </code></pre>
<li> You are Done</li>


This project rocks and uses MIT-LICENSE.
