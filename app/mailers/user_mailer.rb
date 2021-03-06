# coding: utf-8
class UserMailer < ApplicationMailer
  default from: "info@slamalphas.org"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Willkommen bei SLAM ALPHAS')
  end

  def new_user(admin_email, user)
    @admin_email = admin_email

    @user = user
    mail(to: @admin_email, subject: 'Neuer Benutzer!')
  end

  def user_is_public(user)
    @user = user
    mail(to: @user.email, subject: 'Dein Profil ist jetzt öffentlich zugänglich')
  end

  def remind_user(user)
    @user = user
    mail(to: @user.email, subject: 'Vervollständige dein SLAM ALPHAS-Profil')
  end

  def account_added(user)
    @user = user
    mail(to: @user.email, subject: 'Auf Slam Alphas wurde ein Profil für dich angelegt')
  end
end
