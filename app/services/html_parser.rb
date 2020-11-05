class HtmlParser
  def initialize(url)
    @url = url
    parse_url
  end

  private

  def parse_url
    @page = Nokogiri::HTML(URI.open(@url))
    complete_with_page
  rescue StandardError
    @page_md = "(le lien n'a pas pu être ouvert)\n"
  end

  def complete_with_page
    if @url.include? 'www.linkedin.com/jobs/view'
      complete_linked_in
    else
      complete_default
    end
    @page.css('title').each do |title|
      @page_title = title.content
    end
  end

  def complete_linked_in
    @page.css('section.description section div').each do |description|
      description_md = ReverseMarkdown.convert description
      @page_md = "Complété à partir de LinkedIn\n\n"
      @page_md += description_md
    end
  end

  def complete_default
    %w[img script nav canvas svg button figure noscript].each { |tag| @page.search(tag).each(&:remove) }
    @page.css('body').each do |description|
      description_md = ReverseMarkdown.convert(description, unknown_tags: :bypass)
      @page_md = "Page complète, merci de vérifier le contenu\n\n"
      @page_md += description_md
    end
  end
end
