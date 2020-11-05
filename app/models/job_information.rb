class JobInformation < ApplicationRecord
  belongs_to :job_application

  def content_html
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {})
    markdown.render(content)
  end

  def init_with_url(url)
    parser = HtmlParser.new(url)
    content = parser.page_md
  end
end
