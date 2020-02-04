require_relative('../db/sql_runner')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @name = options['name']
    @funds = options['funds'].to_i()
    @id = options['id'].to_i() if options ['id']
  end

  def save()
    sql = "INSERT INTO customers
    (
      name,
      funds
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first()
    @id = customer['id'].to_i()
  end

  def update()
    sql = "
    UPDATE customers SET (
      name,
      funds
    ) =
    (
      $1, $2
    )
    WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.*
    FROM films
    INNER JOIN tickets
    ON tickets.film_id = films.id
    WHERE customer_id = $1"
    values = [@id]
    films = SqlRunner.run(sql, values)
    return Film.map_items(films)
  end

  def ticket_count()
    return films().count()
  end

  def buy_ticket(film, screening)
    ticket_cost = film.price
    if screening.capacity_exceeded? == false && @funds >= ticket_cost
      Ticket.new('film_id' => film.id, 'customer_id' => @id, 'screening_id' => screening.id).save()
      return @funds -= ticket_cost
    else
      return false
    end
  end

  def self.map_items(customer_data)
    results = customer_data.map {|customer| Customer.new(customer)}
    return results
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    return Customer.map_items(customers)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

end
