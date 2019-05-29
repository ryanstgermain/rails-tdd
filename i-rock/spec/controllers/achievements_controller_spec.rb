require 'rails_helper'
require 'spec_helper'

describe AchievementsController do
    describe "GET new" do
        it "renders :new template" do
            get :new
            expect(response).to render_template(:new)
        end

        it "assigns new Achievement to @achievement" do
            get :new
            expect(assigns(:achievement)).to be_a_new(Achievement)
        end
    end
end
