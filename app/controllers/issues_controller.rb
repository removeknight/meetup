class IssuesController < ApplicationController
  def show
  	@issue = Issue.find(params[:id])
    @comments = @issue.comments
  end

  def destroy
  	i = Issue.find(params[:id])
  	i.destroy
  	redirect_to :root
  end

  def new
    if not current_user
      flash[:notice] = "登录后才可以发布😯"
      redirect_to :root
      return
    else
      @issue = Issue.new
    end
  end

  def create
  	issue = Issue.new issue_params
    issue.user_id = current_user.id
    issue.save
  	redirect_to :root
  end

  def edit
    @issue = Issue.find(params[:id])
  end

  def update
  	i = Issue.find(params[:id])
  	i.update_attributes(issue_params)
  	redirect_to :root
  end

  private
  	def issue_params
  		params.require(:issue).permit(:title, :content, :user_id)
  	end
end
