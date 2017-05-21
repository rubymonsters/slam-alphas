class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Willkommen bei Slam Alphas')
  end

  def new_user(admin_user, user)
    @admin_user = admin_user
    @user = user
    mail(to: @admin_user.email, subject: 'Neuer Benutzer!')
  end

  def user_is_public(user)
    @user = user
    mail(to: @user.email, subject: 'Dein Profil ist jetzt öffentlich zugänglich')
  end
end
