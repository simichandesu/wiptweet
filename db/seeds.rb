# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Initial Registration for Organization

Organization.create(name: "USPTO",feed_url: "https://queryfeed.net/twitter?q=from%3Auspto&title-type=user-name-both&geocode=")

Organization.create(name: "WIPO",feed_url: "https://queryfeed.net/twitter?q=%40WIPO&title-type=user-name-both&geocode=")

Organization.create(name: "ipwatch",feed_url: "https://queryfeed.net/twitter?q=%40ipwatch&title-type=user-name-both&geocode=")

Organization.create(name: "GOVUK",feed_url: "https://queryfeed.net/twitter?q=%40GOVUK&title-type=user-name-both&geocode=")

Organization.create(name: "EPOorg",feed_url: "https://queryfeed.net/twitter?q=%40EPOorg&title-type=user-name-both&geocode=")

Organization.create(name: "AIPLA",feed_url: "https://queryfeed.net/twitter?q=%40aipla&title-type=user-name-both&geocode=")

Organization.create(name: "GLOVALIP_JPO",feed_url: "https://queryfeed.net/twitter?q=%40globalipdb_jpo&title-type=user-name-both&")