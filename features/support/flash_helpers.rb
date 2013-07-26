module FlashHelpers
  def show_flash_message(kind, text = nil)
    expect(page).to have_selector("div.alert.alert-#{kind}", text: "#{text}") 
  end
end
World(FlashHelpers)
