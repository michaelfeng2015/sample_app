module ApplicationHelper
  def full_title(page_title="")
    base_title = "一家专业吃东西的网站"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
