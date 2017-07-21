require 'rails_helper'

RSpec.feature "Users can edit existing projects" do
    before do
        FactoryGirl.create(:project, name: "Sublime teto")
        visit "/"
        click_link "Sublime teto"
        click_link "Edit project"
    end
    scenario "with valid attributes" do

        fill_in "Name", with: "Sublime Teto por detras"
        click_button "Update Project"

        expect(page).to have_content "Project has been updated."
        expect(page).to have_content "Sublime Teto por detras"
    end

    scenario "with invalid attributes" do
        fill_in "Name", with: ""
        click_button "Update Project"

        expect(page).to have_content "Project has not been updated."
    end
end
