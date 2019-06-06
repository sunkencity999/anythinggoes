class HomeController < ApplicationController
  def index
  @lastpost = Post.order("created_at desc").limit(3)
  end

end
