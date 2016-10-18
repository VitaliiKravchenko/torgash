class AngularTestController < ApplicationController
  def index
  end
  
  def tabletsList
    render "angular_test/tabletsList"
  end

  def phonesList
    render "angular_test/phonesList"
  end
end
