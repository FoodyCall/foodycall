require 'page-object'

class LandingPage
  include PageObject

  page_url 'http://localhost:3000'

  # define elements
  h1(:company_name, :id => 'company_name')
  div(:company_slogan, :id => 'company_slogan')
  button(:sign_in, id: 'sign_in')
  button(:sign_up, id: 'sign_up')
  #
  # def generate_results(countries, categories)
  # 	self.countries = countries
  # 	self.categories = categories
  # 	submit
  # 	chart_check(self.chart)
  #   tour_check(self.tours)
  # end
  #
  # # check that the title is found somewhere in the div since the chart will have a legend of country names in the div
  # def chart_check(chart)
  #   chart.must_match(/Belize/i)
  # end
  #
  # def tour_check(tour)
  #   tour.must_match(/found/i)
  # end
end
