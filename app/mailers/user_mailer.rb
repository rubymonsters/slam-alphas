# coding: utf-8
class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Willkommen bei SLAM ALPHAS')
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

  def remind_user(user)
    @user = user
    mail(to: @user.email, subject: 'Vervollständige dein SLAM ALPHAS-Profil')
  end
end
