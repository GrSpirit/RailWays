class CommentsController < ApplicationController
  http_basic_authenticate_with name: 'dhh', password: 'secret', only: :destroy

  def create
    @wagon = Wagon.find(params[:wagon_id])
    @comment = @wagon.comments.create(comment_params)

    redirect_to wagon_path(@wagon)
  end

  def destroy
    @wagon = Wagon.find(params[:wagon_id])
    @comment = @wagon.comments.find(params[:id])
    @comment.destroy

    redirect_to wagon_path(@wagon)
  end

private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
