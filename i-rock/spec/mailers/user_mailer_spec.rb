require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
    it 'sends achievement created email to author' do
        email = UserMailer.achievement_created('author@email.com').deliver_now
        expect(email.to).to include('author@email.com')
    end
end
