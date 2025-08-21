class CommentsController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @comment = @review.comments.build(comment_params)
    if @comment.save
      redirect_to @review, notice: "コメントを投稿しました。"
    else
      flash.now[:alert] = "コメントを投稿できませんでした。"
      render "reviews/show", status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:review_id])
    @comment = @review.comments.find(params[:id])
    @comment.destroy
    redirect_to @review, notice: "コメントを削除しました。"
  end

  private
  def comment_params
    params.require(:comment).permit(:name, :body)
  end
end
