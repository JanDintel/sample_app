module FlashHelpers
  def show_flash_message(kind)
    expect(page).to have_selector("div.alert.alert-#{kind}") 
  end
end
World(FlashHelpers)
