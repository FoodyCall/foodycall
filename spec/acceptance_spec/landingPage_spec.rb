require_relative 'init'
require_relative 'page_objects/landing_page'
require 'page-object'

describe 'Landing Page' do
  include PageObject::PageFactory

  before do
  	unless @browser
  	  @headless = Headless.new
  	  @browser = Watir::Browser.new
  	end
  end

  describe 'Visiting HomePage' do
  	it 'check if the company name is foodyCall' do
      visit LandingPage do |page|
        page.company_name.must_equal 'FoodyCall'
        page.company_slogan.must_equal 'Cook Together, Happy Together'
        page.sign_up.must_equal 'Sign Up'
        page.sign_in.must_equal 'Sign In'
      end
  	end

     # also test if no data exists

    # it 'generates a visualization' do
    #   visit DashboardPage do |page|
    #     countries = 'Belize'
    #     categories = 'Small Group Tours'
    #     page.generate_results(countries,categories)
    #   end
    # end
  end
end
