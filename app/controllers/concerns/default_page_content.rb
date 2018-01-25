module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_filter :set_page_defaults
  end

  def set_page_defaults
    @page_title = Portfolio
    @seo_keywords = "Charli Bregnballe portfolio, whatever something"
  end
end
