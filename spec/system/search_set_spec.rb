require_relative "spec_helper"

describe "Search Movie Functionality" do
  it "can find search results" do
    @driver.manage.timeouts.implicit_wait = 10
    @driver.navigate.to "http://localhost:3000/"

    raise "Unable to load Google." unless @driver.title.include? "Google"

    query = @driver.find_element :name, "q"
    query.send_keys "TestingBot"
    query.submit

    puts @driver.title
  end
end
