class HomesController < ApplicationController
  def top
    @blogs_new = Blog.all.order(created_at: "DESC").limit(10)
    @blogs_ran = Blog.select('blogs.*', 'count(favorites.id) AS favorites').
      left_joins(:favorites).
      group('blogs.id').
      order('favorites DESC').
      limit(5)
  end

  def about
  end
end
