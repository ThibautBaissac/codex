  class PasswordMailerPreview < ActionMailer::Preview
    def password_reset
      user = User.first
      Authentication::PasswordMailer.with(
        user:, token:
        user.generate_token_for(:password_reset)
      ).password_reset
    end
  end
