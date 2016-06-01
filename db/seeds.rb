def open_fixture_file(filename)
  File.open(Rails.root.join('test', 'fixtures', 'files', filename))
end

paul = User.create! email: 'paul@chobert.fr',
  is_admin: true,
  name: 'Paul Chobert',
  title: 'Ruby on Rails developper'

paul_2 = User.create! email: 'latifa@fivebyfive.io',
  name: 'Latifa Danfakha',
  title: ''

category_1 = Category.create! name: 'cat 1',
  tile_image: open_fixture_file('carousel_item_2.jpg')

Partner.create! name: 'SNCF', website_url: 'http://www.scnf.com',
  logo: open_fixture_file('sncf.png')
Partner.create! name: 'RATP', website_url: 'http://www.ratp.fr/',
  logo: open_fixture_file('ratp.png')

Page.create! title: "La démarche",
  slug: 'demarche',
  body: 'TO EDIT'
