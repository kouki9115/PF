class HomesController < ApplicationController
  def top
    @blogs=Blog.page(params[:page]).reverse_order
  end

  def about
  end
end
