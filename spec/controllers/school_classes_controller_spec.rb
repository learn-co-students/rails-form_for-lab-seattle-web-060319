require 'rails_helper'


describe SchoolclassesController do

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new schoolclass" do
        expect{
          post :create, params: { :schoolclass => { :title => "Computer Science", :room_number => 5 } }
        }.to change(Schoolclass,:count).by(1)
      end

      it "redirects to the new schoolclass" do
        post :create, params: { :schoolclass => { :title => "Computer Science", :room_number => 5 } }
        expect(response).to redirect_to Schoolclass.last
      end
    end
  end

end
