require 'rails_helper'
require 'spec_helper'

Rspec.describe EncouragementController do
    let(:user) { FactoryBot.create(:user) }
    let(:author) { FactoryBot.create(:user) }
    let(:achievement) { FactoryBot.create(:public_achievement, user: author) }

    describe "GET new" do
        context 'guest user' do
            it 'is redirected back to achievement page' do
                get :new, params: { achievement_id: achievement.id }
                expect(response).to redirect_to(achievement_path(achievement))
            end

            it 'assigns flash message'
        end

        context 'authenticate user' do
            it 'renders :new template'
            it 'assigns new encouragement to template'
        end

        context 'achievement author' do
            it 'is redirected back to achievement page'
            it 'assigns flash message'
        end

        context 'user who already left encouragement for this achievement' do
            it 'is redirected back to achievement page'
            it 'assigns flash message'
        end
    end
end
