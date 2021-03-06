require "rails_helper"

RSpec.feature "Users can delete projects" do
    before do
        login_as(FactoryGirl.create(:user, :admin))
    end

    scenario "successfully" do
        FactoryGirl.create(:project, name: "Sublime teto 3")

        visit "/"
        click_link "Sublime teto 3"
        click_link "Delete project"

        expect(page).to have_content "Project has been deleted."
        expect(page.current_url).to eq projects_url
        expect(page).to have_no_content "Sublime teto 3"
    end
end
