class JobApplicationParser
  def initialize(job_application)
    @job_application = job_application
  end

  def complete_job_application
    @url = @job_application.url
    complete_with_url if @url
  end

  private

  def complete_with_url
    @page = Nokogiri::HTML(URI.open(@url))
    complete_with_page
  rescue StandardError
    @job_application.description = "Le lien n'a pas pu être ouvert, merci de remplir :\n"
  end

  def complete_with_page
    if @url.include? 'www.linkedin.com/jobs/view'
      complete_linked_in
    else
      complete_default
    end
  end

  def complete_linked_in
    put_title_as_title_tag
    @page.css('section.description section div').each do |description|
      description_md = ReverseMarkdown.convert description
      @job_application.description = "Complété à partir de LinkedIn\n\n"
      @job_application.description += description_md
    end
  end

  def complete_default
    put_title_as_title_tag
    %w[img script nav canvas svg button figure noscript].each { |tag| @page.search(tag).each(&:remove) }
    @page.css('body').each do |description|
      puts '*' * 99
      puts description
      description_md = ReverseMarkdown.convert(description, unknown_tags: :bypass)
      @job_application.description = "Page complète, merci de vérifier le contenu\n\n"
      @job_application.description += description_md
    end
  end

  def put_title_as_title_tag
    @page.css('title').each do |title|
      @job_application.title = title.content
    end
  end
end
