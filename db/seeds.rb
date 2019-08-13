# coding: utf-8
# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
#
User.create!(
  name: "Svenja Graefen",
  city: "Berlin",
  country: "de",
  email: "mail@svenjagraefen.de",
  password: "password",
  password_confirmation: "password",
  website: "http://svenjagraefen.de",
  facebook_link: "https://fb.com/svenjagraefen",
  video_link: "https://vimeo.com/89895541",
  is_available_on: [0],
  custom_availability: 'Heute keine',
  year_of_birth: 1990,
  alpha: true,
  recommended_by: 1,
  admin: true,
  will_travel: 'keine')

# TODO: to be added when we have the columsrails
# Kann wann: Wochenende, unter der Woche, Urlaubs-/Ferienzeiten
# Kann wo: überall
# Reist mit: Zug 'im Besitz von: BC50


User.create!(
  name: "Franziska Holzheimer",
  city: "Wien",
  country: "at",
  email: "info@franziskaholzheimer.de",
  password: "password",
  password_confirmation: "password",
  website: "http://www.franziskaholzheimer.de",
  video_link: "https://vimeo.com/89895541",
  is_available_on: [1],
  custom_availability: 'Mit Schirm, Charme und Melone',
  year_of_birth: 1988,
  alpha: true,
  recommended_by: 1,
  admin: true,
  will_travel: 'keine')

# TODO: to be added when we have the colums
# video: "https://vimeo.com/89895541"
# Kann wann: Wochenende, unter der Woche, Urlaubs-/Ferienzeiten
# Kann wo: überall
# Reist mit: Zug; im Besitz von: BC50, Vorteilscard Classic (Name Österreichcard ist falsch ;D)

cities = ["Hamburg", "Berlin", "München", "Frankfurt am Main", "Bremen", "Stuttgart", "Düsseldorf"]

37.times do
  name = Faker::Name.name
  email = Faker::Internet.email
  password = 'password'
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    city: cities.sample,
    video_link: "https://vimeo.com/89895541",
    is_available_on: [1],
    custom_availability: 'Nichts Weltbewegendes',
    year_of_birth: 1988,
    alpha: false,
    recommended_by: 1,
    country: "de",
    will_travel: 'keine')
end
