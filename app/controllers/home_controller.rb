class HomeController < ApplicationController
  skip_before_filter :restrict_access_by_token

  def index
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new)
    @readme = markdown.render(IO.read(Rails.root.join 'Readme.md')).html_safe
  end
end
