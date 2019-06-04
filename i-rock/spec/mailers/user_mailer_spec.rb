require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
    let(:email) { UserMailer.achievement_created('author@email.com').deliver_now }

    it 'sends achievement created email to author' do
        expect(email.to).to include('author@email.com')
    end

    it 'has correct subject' do
        expect(email.subject).to eq('Congratulations with your new achievement!')
    end
end
