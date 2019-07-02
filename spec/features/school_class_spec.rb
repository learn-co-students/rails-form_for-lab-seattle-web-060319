require 'rails_helper'


describe 'form page' do
  it 'form renders with the new action' do
    visit new_schoolclass_path
    expect(page).to have_content("School Class Form")
  end

  it 'new form submits content and renders form content' do
    visit new_schoolclass_path

    fill_in 'schoolclass_title', with: "Software Engineering"
    fill_in 'schoolclass_room_number', with: 10

    click_on "Create School class"

    expect(page).to have_content("Software Engineering")
  end

  it 'edit form submits content and renders form content' do
    @edit_schoolclass = Schoolclass.create(title: "Computer Science", room_number: 5)

    visit edit_schoolclass_path(@edit_schoolclass)

    fill_in 'schoolclass_title', with: "Risk Analysis"
    fill_in 'schoolclass_room_number', with: 10

    click_on "Update School class"

    expect(page).to have_content("Risk Analysis")
  end

  it 'submitted new form creates a record in the database' do
    visit new_schoolclass_path

    fill_in 'schoolclass_title', with: "Sabermetrics"
    fill_in 'schoolclass_room_number', with: 42

    click_on "Create School class"

    expect(Schoolclass.last.title).to eq("Sabermetrics")
  end

  it 'submitted edit form creates a record in the database' do
    @edit_db_schoolclass = Schoolclass.create(title: "Computer Science", room_number: 5)

    visit edit_schoolclass_path(@edit_db_schoolclass)

    fill_in 'schoolclass_title', with: "Machine Learning"
    fill_in 'schoolclass_room_number', with: 11

    click_on "Update School class"

    expect(Schoolclass.last.title).to eq("Machine Learning")
  end
end

describe 'Show page' do
  let(:schoolclass) { Schoolclass.create(title: "Computer Science", room_number: 5) }

  it 'renders properly' do
    visit schoolclass_path(schoolclass)
    expect(page.status_code).to eq(200)
  end

  it 'renders the school class title' do
    visit schoolclass_path(schoolclass)
    expect(page).to have_content("Computer Science")
  end
end