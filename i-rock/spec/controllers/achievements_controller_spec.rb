require 'rails_helper'
require 'spec_helper'

describe AchievementsController do

    describe "GET index" do
        it "renders :index template" do
            get :index
            expect(response).to render_template(:index)
        end

        it "assigns only public achievements to template" do
            public_achievement = FactoryBot.create(:public_achievement)
            private_achievement = FactoryBot.create(:private_achievement)
            get :index
            expect(assigns(:achievements)).to match_array([public_achievement])
        end
    end

    describe "GET edit" do
        let(:achievement) { FactoryBot.create(:public_achievement)}

        it "renders :edit template" do
            get :edit, params: { id: achievement }
            expect(response).to render_template(:edit)
        end

        it "assigns the requested achievement to template" do
            get :edit, params: { id: achievement }
            expect(assigns(:achievement)).to eq(achievement)
        end
    end

    describe "PUT update" do
        let(:achievement) { FactoryBot.create(:public_achievement)}

        context "valid data" do
            let(:valid_data) { FactoryBot.attributes_for(:public_achievement, title: "New Title") }

            it "redirects to achievements#show" do
                put :update, params: { id: achievement, achievement: valid_data }
                expect(response).to redirect_to(achievement)
            end

            it "updates achievement in the database"
        end

        context "invalid data" do
        end
    end

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

    describe "GET show" do
        let(:achievement) { FactoryBot.create(:public_achievement) }

        it "renders :show template" do
            get :show, params: { id: achievement }
            expect(response).to render_template(:show)
        end

        it "assigns requested achievement to @achievement" do
            get :show, params: { id: achievement }
            expect(assigns(:achievement)).to eq(achievement)
        end
    end

    describe "POST create" do
        let(:valid_data) { FactoryBot.attributes_for(:public_achievement) }

        context "valid data" do
            it "redirects to achievements#show" do
                post :create, params: { achievement: valid_data }
                expect(response).to redirect_to(achievement_path(assigns[:achievement]))
            end

            it "creates new achievement in database" do
                expect {
                    post :create, params: { achievement: valid_data }
                }.to change(Achievement, :count).by(1)
            end
        end

        context "invalid data" do
            let(:invalid_data) { FactoryBot.attributes_for(:public_achievement, title: '') }

            it "renders :new template" do
                post :create, params: { achievement: invalid_data }
                expect(response).to render_template(:new)
            end

            it "doesn't create new achievement in the database" do
                expect {
                    post :create, params: { achievement: invalid_data }
                }.not_to change(Achievement, :count)
            end
        end
    end
end