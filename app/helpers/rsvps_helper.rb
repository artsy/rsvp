module RsvpsHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(filter_html: true, no_images: true, no_styles: true, hard_wrap: true)
    markdown = Redcarpet::Markdown.new(renderer)
    markdown.render(text).html_safe
  end
end
