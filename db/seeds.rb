
Provider.delete_all
sara_smith = Provider.create provider_contact: 'ssmith@aaa.com', provider_name: 'Sara Smith',
                                    provider_address: '100 West Jackson Chicago IL 60614', rate: 105
jim_jackson = Provider.create provider_contact: 'jjackson@bbb.com', provider_name: 'Jim Jackson',
                                     provider_address: '100 West Monroe Peoria IL 60001', rate: 55
junior_smith = Provider.create provider_contact: 'jsmith@ccc.com',provider_name: 'Junior Smith',
                                      provider_address: '2 Capital St. Cleveland OH 44709',rate: 75
karen_carter = Provider.create provider_contact: 'kcarter@ddd.com', provider_name: 'Karen Carter',
                                      provider_address: '505 11th Ave New York NY 20005',rate: 100
lucy_luciano = Provider.create provider_contact: 'lluciano@eee.com', provider_name: 'Lucy Luciano',
                                      provider_address: '100 Madison Ave New York NY 20005',rate: 900


Service.delete_all
service_data = JSON.parse(open('db/service_data.json').read)
service_data['services'].each do |data|
  s = Service.create service_desc: data['service_desc']
end


Client.delete_all
sam_smith = Client.create client_contact: 'ssmith@alawfirm.com', client_name: 'Sam Smith',
                          client_address: '100 West Jackson Chicago IL 60614'
janet_jackson = Client.create client_contact: 'jjackson@blawfirm.com', client_name: 'Janet Jackson',
                              client_address: '100 West Monroe Peoria IL 60001'
jack_smith = Client.create client_contact: 'jsmith@clawfirm.com', client_name: 'Jack Smith',
                           client_address: '2 Capital St. Cleveland OH 44709'
karen_carter = Client.create client_contact: 'kcarter@dlawfirm.com', client_name: 'Kevin Carter',
                             client_address: '505 11th Ave, New York New York 20005'
lucky_luciano = Client.create client_contact: 'lluciano@moblaw.com', client_name: 'Lucky Luciano',
                              client_address: '100 Madison Ave New York New York 20005'
bob_roberts = Client.create client_contact: 'broberts@elaw.com',client_name: 'Bob Roberts',
                            client_address: '5 West Data St. San Francisco CA 90909'
hillary_clinton = Client.create  client_contact: 'hclinton@roselaw.com', client_name: 'Hillary Clinton',
                                 client_address: '100 GovEntGen Street Little Rock AK 30311'
donald_trump = Client.create client_contact: 'dtrump@loudlaw.com', client_name: 'Don Trump',
                             client_address: '1000 Trump Tower Drive New York New York 20001'
joe_biden = Client.create client_contact: 'jbiden@bidenlawfirm.com', client_name: 'Joe Biden',
                                         client_address: '10 Penn Ave, Washington DC 20202'
clarence_darrow = Client.create client_contact: 'cdarrow@peoplelaw.com', client_name: 'Clarence Darrow',
                                client_address: '5 Hollywood Blvd, Los Angelese CA 90005'

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