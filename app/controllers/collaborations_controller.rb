class CollaborationsController < ApplicationController
  before_action :find_wiki

  def create
    @collaboration = Collaboration.new(wiki_id: @wiki.id, user_id: params[:user_id])
    if @collaboration.save
      flash[:notice] = "Your wiki was updated with a new collaborator."
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:error] = "There was an error updating your wiki. Please try again."
      render :show
    end
  end

  def destroy
    @collaboration = Collaboration.find(params[:id])
    if @collaboration.destroy
      flash[:notice] = "Collaborator was removed and wiki was successfully updated."
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:error] = "There was an error updating your wiki. Please try again."
      render :show
    end
  end

  private

  def find_wiki
    @wiki = Wiki.friendly.find(params[:wiki_id])
  end
end
