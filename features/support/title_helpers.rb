module TitleHelpers
  def correct_page_with_title(title_partial)
    expect(page).to have_title(full_title(title_partial))
  end

  def full_title(page_title)
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
World(TitleHelpers)

