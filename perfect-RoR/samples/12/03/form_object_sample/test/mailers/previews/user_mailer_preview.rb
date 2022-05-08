# Preview all emails at http://localhost:3000/rails/mailers/user_mailer

class UserMailerPreview < ActionMailer::Preview
  def welcome
    UserMailer.with(user: User.new(email: "test@example.com")).welcome
  end
end
