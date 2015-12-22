class Api::ArticlesController < ApplicationController

  def create
    # saves an article to the specific user, no annotations yet.
    url = params[:url]
    @article = Article.new({url: url, user_id: current_user.id})
    if @article.save
      render json: @article.to_json
    else
      render json: {errors: @article.errors.full_messages}
    end
  end
end
