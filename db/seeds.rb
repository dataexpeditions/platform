def open_fixture_file(filename)
  File.open(Rails.root.join('test', 'fixtures', 'files', filename))
end

Partner.create! name: 'SNCF', website_url: 'http://www.scnf.com',
  logo: open_fixture_file('sncf.png')
Partner.create! name: 'RATP', website_url: 'http://www.ratp.fr/',
  logo: open_fixture_file('ratp.png')

Page.create! title: "La démarche",
  slug: 'demarche',
  body: 'TO EDIT'
