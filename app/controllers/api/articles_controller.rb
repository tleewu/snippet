class Api::ArticlesController < ApplicationController

  def create
    # saves an article to the specific user, no annotations yet.
    url = article_params[:url]
    user = User.find_by_session_token({article_params[:session_token]})
    @article = Article.new({url: url, user_id: user.id})
    if @article.save
      render json: @article.to_json
    else
      render json: {errors: @article.errors.full_messages}
    end
  end


  private

  def article_params
    params.require(:article).permit(:session_token, :url)
  end
end
