require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')
require_relative('models/screening')

require('pry-byebug')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()
Screening.delete_all()

# CUSTOMERS #
customer1 = Customer.new({
  'name' => 'Calum',
  'funds' => 50
  })
customer1.save()

customer2 = Customer.new({
  'name' => 'Fraser',
  'funds' => 20
  })
customer2.save()

customer3 = Customer.new({
  'name' => 'Malcolm',
  'funds' => 30
  })
customer3.save()

customer4 = Customer.new({
  'name' => 'Gareth',
  'funds' => 30
  })
customer4.save()

customer5 = Customer.new({
  'name' => 'Noel',
  'funds' => 40
  })
customer5.save()

customer6 = Customer.new({
  'name' => 'Roosa',
  'funds' => 5
  })
customer6.save()



# FILMS #
film1 = Film.new({
  'title' => 'La La Land',
  'price' => 10
  })
film1.save()

film2 = Film.new({
  'title' => 'Zombieland: Double Tap',
  'price' => 10
  })
film2.save()

film3 = Film.new({
  'title' => 'Knives Out',
  'price' => 10
  })
film3.save()

film4 = Film.new({
  'title' => '1917',
  'price' => 10
  })
film4.save()



# SCREENINGS #
screening1 = Screening.new({
  'show_time' => '18:00',
  'film_id' => film1.id,
  'capacity' => 4
  })
screening1.save()

screening2 = Screening.new({
  'show_time' => '20:00',
  'film_id' => film1.id,
  'capacity' => 4
  })
screening2.save()

screening3 = Screening.new({
  'show_time' => '22:00',
  'film_id' => film1.id,
  'capacity' => 4
  })
screening3.save()

screening4 = Screening.new({
  'show_time' => '12:00',
  'film_id' => film2.id,
  'capacity' => 3
  })
screening4.save()

screening5 = Screening.new({
  'show_time' => '14:00',
  'film_id' => film2.id,
  'capacity' => 3
  })
screening5.save()

screening6 = Screening.new({
  'show_time' => '16:00',
  'film_id' => film2.id,
  'capacity' => 3
  })
screening6.save()

screening7 = Screening.new({
  'show_time' => '10:00',
  'film_id' => film3.id,
  'capacity' => 2
  })
screening7.save()

screening8 = Screening.new({
  'show_time' => '12:00',
  'film_id' => film3.id,
  'capacity' => 2
  })
screening8.save()

screening9 = Screening.new({
  'show_time' => '14:00',
  'film_id' => film3.id,
  'capacity' => 2
  })
screening9.save()

screening10 = Screening.new({
  'show_time' => '13:00',
  'film_id' => film4.id,
  'capacity' => 4
  })
screening10.save()

screening11 = Screening.new({
  'show_time' => '15:00',
  'film_id' => film4.id,
  'capacity' => 4
  })
screening11.save()

screening12 = Screening.new({
  'show_time' => '17:00',
  'film_id' => film4.id,
  'capacity' => 4
  })
screening12.save()



# TICKETS #
ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id,
  'screening_id' => screening1.id
  })
ticket1.save()

ticket2 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film1.id,
  'screening_id' => screening1.id
  })
ticket2.save()

ticket3 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film1.id,
  'screening_id' => screening1.id
  })
ticket3.save()

ticket4 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film2.id,
  'screening_id' => screening4.id
  })
ticket4.save()

ticket5 = Ticket.new({
  'customer_id' => customer5.id,
  'film_id' => film2.id,
  'screening_id' => screening5.id
  })
ticket5.save()

ticket6 = Ticket.new({
  'customer_id' => customer6.id,
  'film_id' => film3.id,
  'screening_id' => screening7.id
  })
ticket6.save()

ticket7 = Ticket.new({
  'customer_id' => customer4.id,
  'film_id' => film4.id,
  'screening_id' => screening11.id
  })
ticket7.save()

ticket8 = Ticket.new({
  'customer_id' => customer5.id,
  'film_id' => film4.id,
  'screening_id' => screening11.id
  })
ticket8.save()

ticket9 = Ticket.new({
  'customer_id' => customer4.id,
  'film_id' => film1.id,
  'screening_id' => screening1.id
  })
ticket9.save()





binding.pry
nil
