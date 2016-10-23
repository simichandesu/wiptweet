# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Initial Registration for Organization

Organization.create(name: "USPTO",latitude: "38.8015712",longitude: "-77.0660395",feed_url: "https://queryfeed.net/twitter?q=from%3Auspto&title-type=user-name-both&geocode=")
Organization.create(name: "WIPO",latitude: "46.221905",longitude: "6.136669",feed_url: "https://queryfeed.net/twitter?q=from%3AWIPO&title-type=user-name-both&geocode=")
Organization.create(name: "EPOorg",latitude: "52.042157",longitude: "4.336780",feed_url: "https://queryfeed.net/twitter?q=from%3AEPOorg&title-type=user-name-both&geocode=")
