class StudiesController < ApplicationController
  before_action :load_study, only: [:show, :new, :edit, :destroy]

  def index
    @studies = Study.accepted
    authorize! :read, Study
  end

  def show
    authorize! :read, @study
  end

  protected

  def load_study
    @study = params[:id] && Study.includes(:author, :category).find(params[:id]) || Study.new
  end
end
