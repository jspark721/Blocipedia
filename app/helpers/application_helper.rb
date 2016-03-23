module ApplicationHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    options = {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
    }
    redcarpet = Redcarpet::Markdown.new(renderer, options)
    (redcarpet.render text).html_safe
  end
end
