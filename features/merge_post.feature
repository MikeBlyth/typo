Feature: Create Blog
  As an administrator
  In order to organize this blog
  I want to merge similar blog posts

Background:
  Given the blog is set up
  And I am logged into the admin panel
  And article "First Post" exists with comments
  And article "Second Post" exists with comments
  And I edit "First Post"

Scenario: Merge this post with another
  When I enter the ID for "Second Post" in the Merge Article box
  And I press "Merge"
  Then I should see "Successfully merged"
  And the article title should be "First Post"
  And the body should include the "First Post" body
  And the body should include the "Second Post" body
  And the author should be the "First Post" author
  And the comments should include the "First Post" comments
  And the comments should include the "Second Post" comments
  
  
