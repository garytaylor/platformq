# Integration spec for the main blog page
# It is assumed that the basics for a blog is that we need some form of authentication so we dont get
#  lots of posts about viagra and the latest super skinny pill advertised all over our site.
# Therefore, the tests are divided into 2 contexts - one when not logged in and one when logged in
require 'spec_helper'
describe 'The blog page' do
  # A page object representing the home page which technically should be called the articles page - this will
  # allow for a different home page in the future (for example if we wanted to advertise something before going into the blog)
  let(:articles_page) do
    articles = PageObject::Articles.new
    articles.load
    articles
  end
  let(:articles) do
    # mock_articles is a simple helper to setup a quantity of articles for our tests
    mock_articles quantity: 10, with_comments: 2
  end
  before :each do
    # Before doing anything, access the articles so they get generated
    @articles = articles
  end

  #Here we have tests that are common to whether the user is logged in or not
  shared_examples "A list of articles" do
    it 'Should list 10 articles with the correct titles' do
      # Here, we use the power of the page objects to keep our tests looking simple.
      # So, articles_page.article_titles will return an array of strings which is the exact text that the user sees
      # under the hood, it does this using capybara and selenium along with a browser, but the tests show none of this
      # complexity.
      # The page objects also deal with waiting for the condition to become true up to the global timeout setting (normally 2 seconds).
      # If this didnt happen, we may check for it too early and the test fails - if it had waited 0.05 seconds, it would have appeared.
      # The code below may have to change for this to happen if we cant make it happen using standard rspec matchers, however - the code
      # reads what I want it to read, so this is my first stab at it.
      expect(articles_page.article_titles).to contain_exactly(10).items
      expect(articles_page.article_titles).to eql(articles.map {|a| a.title})
    end
    it 'Should show the correct article detail when clicked on' do
      # Again, we use the power of the page objects to click on a given article (the 4th one - at index 3)
      article = articles[3]
      articles_page.click_article_title article.title
      expect(articles_page.article).to be_visible
      expect(articles_page.article.title).to eql article.title
      # Here, I am using a helper to format the expected date - as the format could change in the future, or could
      #  be changed when a user logs in from a different country etc...  It is also just good practice to keep things DRY
      expect(articles_page.article.posted_on).to eql standard_date_format_for(article.posted_on)
      expect(articles_page.article.author).to eql article.owner.name
      # The body is stored as markdown but the user wants to see HTML
      expect(articles_page.article.body).to eql markdown_to_html(article.body)
      expect(articles_page.article.comment_names).to have(2).items

      # Only the first article will be checked here.
      # Note that comments will be an iterable object, not a pre populated array.  This means that we only ask selenium
      # for the nodes that we are interested in rather than grabbing all of the comments just to throw most of them away.
      expect(articles_page.article.comments[0].author).to eql(article.comments[0].author)
      # it is assumed that the comments are text only - no markdown etc...
      expect(articles_page.article.comments[0].body).to eql(article.comments[0].body)
      expect(articles_page.article.comments[0].posted_on).to eql standard_date_format_for(article.comments[0].posted_on)
    end
  end

  # tests for a non logged in user - pretty much the same as a logged in user, but eventually, the two may become very different, so split them here
  context 'As a non logged in user' do
    it_behaves_like "A list of articles"
    it 'Should allow commenting on an individual article' do
      pending
    end
    it 'Should not allow the creation of an article' do
      pending
    end
  end

  # tests for a logged in user
  context 'As a logged in user' do
    # We are not testing the login system here, so use the login_as helper to automatically log the user in before each test runs
    before :each do
      # The login helper does not cheat - it actually logs in.
      login_as :blogger
    end
    it_behaves_like "A list of articles"
    # The spec says articles should have comments, so it is assumed that these comments come from the user.
    it 'Should allow the user to comment' do
      pending
    end
    # rather than a seperate admin panel, it may be more efficient to allow a logged in user to create a new article directly from the page
    it 'Allows the creation of an article' do
      pending
    end
  end

end