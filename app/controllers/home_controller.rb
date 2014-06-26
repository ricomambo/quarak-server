class HomeController < ApplicationController
  skip_before_filter :authenticate_token!

  def index
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new)
    @readme = markdown.render(IO.read(Rails.root.join 'README.md')).html_safe
  end
end
