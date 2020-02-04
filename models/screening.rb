require_relative("../db/sql_runner")

class Screening

  attr_reader :id
  attr_accessor :film_id, :show_time, :capacity

  def initialize(options)
    @show_time = options['show_time']
    @film_id = options['film_id'].to_i()
    @capacity = options['capacity'].to_i()
    @id = options['id'].to_i() if options['id']
  end

  def save()
    sql = "INSERT INTO screenings
    (
      show_time,
      film_id,
      capacity
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@show_time, @film_id, @capacity]
    screening = SqlRunner.run(sql, values).first()
    @id = screening['id'].to_i()
  end

  def update()
    sql = "
    UPDATE screenings SET (
      show_time,
      film_id,
      capacity
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@show_time, @film_id, @capacity, @id]
    SqlRunner.run(sql, values)
  end

  def tickets()
    sql = "SELECT tickets.*
    FROM tickets
    INNER JOIN screenings
    ON tickets.screening_id = screenings.id
    WHERE screening_id = $1"
    values = [@id]
    tickets = SqlRunner.run(sql, values)
    return Ticket.map_items(tickets)
  end

  def self.tickets_sold(screening)
    return screening.tickets().count()
  end

  def self.most_popular_screening_of_film(film)
    screenings = film.screenings
    tickets_sold_array = screenings.map { |screening| self.tickets_sold(screening)}
    index = tickets_sold_array.index(tickets_sold_array.max)
    return screenings[index]
  end

  def capacity_exceeded?()
    if tickets_sold() >= @capacity
      return true
    else
      return false
    end
  end

  def self.map_items(screening_data)
    results = screening_data.map {|screening| Screening.new(screening)}
    return results
  end

  def self.all()
    sql = "SELECT * FROM screenings"
    screenings = SqlRunner.run(sql)
    return Screening.map_items(screenings)
  end

  def self.delete_all()
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end



end
