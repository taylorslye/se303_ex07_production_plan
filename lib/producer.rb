class Producer

  attr_reader :name, :production
  attr_accessor :cost

  def initialize(province, data)
    @province = province
    @cost = data[:cost]
    @name = data[:name]
    @production = data[:production] || 0
  end

  def production=(amount)
    new_production = amount.to_i
    @province.total_production += new_production - @production
    @production = new_production
  end

end
