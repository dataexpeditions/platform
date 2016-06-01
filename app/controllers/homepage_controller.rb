class HomepageController < ApplicationController
  def home
    @carousel_study = Study.where(in_carousel: true).first
    @last_studies = Study.accepted.order(created_at: :desc).limit(5)
  end
end
