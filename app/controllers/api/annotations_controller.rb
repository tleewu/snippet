class Api::AnnotationsController < ApplicationController

  def create
    user_id = current_user.id
    current_article = Article.find_by_url_and_user_id(annotation_params[:url], user_id})
    unless current_article
      current_article = Article.create!({user_id: user_id, url: url})
    end
    annotation_params[:article_id] = current_article.id
    @annotation = Annotation.new(annotation_params)
    if @annotation.save
      render json: @annotation.to_json
    else
      render json: {errors: @annotation.errors.full_messages}
    end
  end

  private

  def annotation_params
    params.require(:annotation).permit(:url, :highlight, :start_node, :start_offset)
  end
end
