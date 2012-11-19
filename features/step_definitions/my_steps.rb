require 'uri'
require 'cgi'
require '~/typo/spec/spec_helper.rb'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

Given /^I am logged as non\-admin$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'user'
  fill_in 'user_password', :with => 'bbbbbbbb'
  click_button 'Login'
#save_and_open_page
#  page.should have_content('Login successful')
end

And /^article "(.*)" exists with comments$/ do |title|
  article = Factory.create(:article, :title => title, :body => "This is the body for article '#{title}'")

  Factory.create(:comment, :title => "First comment on article #{title}", :article_id => article.id)  
  Factory.create(:comment, :title => "Second comment on article #{title}", :article_id => article.id)
end

And /^I edit the article "(.*)"/ do |title|
  article = Article.find_by_title title
  visit "/admin/content/edit/#{article.id}"
end

When /^I edit my article$/ do
  article = Factory.create(:article, :title => 'Some Article', :body => "This is the body for 'Some Article'",
     :user_id => User.last.id)
  visit "/admin/content/edit/#{article.id}"
save_and_open_page
end

When /^I enter the ID for "(.*?)" in the Merge Article box$/ do |title|
  id =  Article.find_by_title(title).id
  fill_in 'merge_with', :with => id
end

Then /^the article title should be "(.*?)"$/ do |title|
#save_and_open_page
  puts page.body
end

Then /^the body should include the "(.*?)" body$/ do |title|
  pending # express the regexp above with the code you wish you had
end

Then /^the author should be the "(.*?)" author$/ do |title|
  pending # express the regexp above with the code you wish you had
end

Then /^the comments should include the "(.*?)" comments$/ do |title|
  pending # express the regexp above with the code you wish you had
end


