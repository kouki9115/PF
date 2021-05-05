class HomesController < ApplicationController
  def top
    @blogs=Blog.all
  end

  def about
  end
end
