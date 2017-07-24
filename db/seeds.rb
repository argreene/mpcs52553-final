Provider.delete_all
sara_smith = Provider.create provider_contact: 'ssmith@aaa.com', provider_name: 'Sara Smith',
                                    provider_address: '100 West Jackson Chicago IL 60614', rate: 105,
                             description: 'Sara has twenty years of experience working with multinational corporations.'
jim_jackson = Provider.create provider_contact: 'jjackson@bbb.com', provider_name: 'Jim Jackson',
                                     provider_address: '100 West Monroe Peoria IL 60001', rate: 55,
                              description: 'Jim focuses on indivduals whose rights have been violated by the police.'
junior_smith = Provider.create provider_contact: 'jsmith@ccc.com',provider_name: 'Junior Smith',
                                      provider_address: '2 Capital St. Cleveland OH 44709',rate: 75,
                               description: 'Junior handles tax matters, from straightforward to complex.'
karen_carter = Provider.create provider_contact: 'kcarter@ddd.com', provider_name: 'Karen Carter',
                                      provider_address: '505 11th Ave New York NY 20005',rate: 100,
                               description: 'Karen Carter is a nationally recognized trial attorney who has won both bench and jury trials all across the country.'
lucy_luciano = Provider.create provider_contact: 'lluciano@eee.com', provider_name: 'Lucy Luciano',
                                      provider_address: '100 Madison Ave New York NY 20005',rate: 900,
                               description: 'Lucy Luciano represents individuals and corporations in immigration matters'
jon_smith = Provider.create provider_contact: 'jsmith@aaa.com', provider_name: 'Jon Smith',
                             provider_address: '10 South State Chicago IL 60614', rate: 105,
                             description: 'Jon a couple of months of experience working with multinational corporations. But he is cheap.'
bob_jackson = Provider.create provider_contact: 'bjackson@bbb.com', provider_name: 'Bob Jackson',
                              provider_address: '2000 South California Chicago IL 60001', rate: 55,
                              description: 'Bob focuses on individuals and corporations in the music industry.'
alex_smith = Provider.create provider_contact: 'asmith@ccc.com', provider_name: 'Alex Smith',
                               provider_address: '1000 Monroe Cleveland OH 44709',rate: 75,
                               description: 'Alex handles individual tax disputes with the IRS.'
lance_carter = Provider.create provider_contact: 'lcarter@ddd.com', provider_name: 'Lance Carter',
                               provider_address: '11 55th Ave New York NY 20005',rate: 100,
                               description: 'Lance Carter is a nationally recognized corporate attorney, specializing in mergers and acquisitions.'
mindy_luciano = Provider.create provider_contact: 'mluciano@eee.com', provider_name: 'Mindy Luciano',
                               provider_address: '100 Park Ave New York NY 20005',rate: 900,
                               description: 'Mindy Luciano represents small businesses in all of their matters'


Service.delete_all
service_data = JSON.parse(open('db/service_data.json').read)
service_data['services'].each do |data|
  s = Service.create service_desc: data['service_desc']
end

SPS.delete_all

Provider.all.each do |provider|
  Service.all.each do |service|
    r = rand(1..3)
    if r ==1
      SPS.create provider_id: provider.id, service_id: service.id
    end
  end
end


Client.delete_all
sam_smith = Client.create client_contact: 'ssmith@alawfirm.com', client_name: 'Sam Smith',
                          client_address: '100 West Jackson Chicago IL 60614', password: 'password'
janet_jackson = Client.create client_contact: 'jjackson@blawfirm.com', client_name: 'Janet Jackson',
                              client_address: '100 West Monroe Peoria IL 60001', password: 'password'
jack_smith = Client.create client_contact: 'jsmith@clawfirm.com', client_name: 'Jack Smith',
                           client_address: '2 Capital St. Cleveland OH 44709', password: 'password'
karen_carter = Client.create client_contact: 'kcarter@dlawfirm.com', client_name: 'Kevin Carter',
                             client_address: '505 11th Ave, New York New York 20005', password: 'password'
lucky_luciano = Client.create client_contact: 'lluciano@moblaw.com', client_name: 'Lucky Luciano',
                              client_address: '100 Madison Ave New York New York 20005', password: 'password'
bob_roberts = Client.create client_contact: 'broberts@elaw.com',client_name: 'Bob Roberts',
                            client_address: '5 West Data St. San Francisco CA 90909', password: 'password'
hillary_clinton = Client.create  client_contact: 'hclinton@roselaw.com', client_name: 'Hillary Clinton',
                                 client_address: '100 GovEntGen Street Little Rock AK 30311', password: 'password'
donald_trump = Client.create client_contact: 'dtrump@loudlaw.com', client_name: 'Don Trump',
                             client_address: '1000 Trump Tower Drive New York New York 20001', password: 'password'
joe_biden = Client.create client_contact: 'jbiden@bidenlawfirm.com', client_name: 'Joe Biden',
                                         client_address: '10 Penn Ave, Washington DC 20202', password: 'password'
clarence_darrow = Client.create client_contact: 'cdarrow@peoplelaw.com', client_name: 'Clarence Darrow',
                                client_address: '5 Hollywood Blvd, Los Angelese CA 90005', password: 'password'

Orders.delete_all
Client.all.each do |client|
  rand(0..5).times do
    Orders.create client_id: client.id, provider_id: Provider.sample.id, service_id: Service.sample.id, amount: [100..10000].sample
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# provider_ids = []
# Provider.all.each do |provider|
#   provider_ids << provider.id
# end
# serv_ids = []
# Service.all.each do |service|
#   serv_ids << service.id
# end
# client_ids = []
# Client.all.each do |client|
#   client_ids << client.id
# end