gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/province'
require_relative '../lib/data'

class ProvinceTest < Minitest::Test

  describe 'province' do
    def setup
      @asia = Province.new(sample_province_data)
    end

    def test_shortfall
      assert_equal(5, @asia.shortfall)
    end

    def test_profit
      assert_equal(230, @asia.profit)
    end

    def test_change_production
      @asia.producers[0].production = 20
      assert_equal(-6, @asia.shortfall)
      assert_equal(292, @asia.profit)
    end

    def test_zero_demand
      @asia.demand = 0
      assert(-25, @asia.shortfall)
      assert(0, @asia.profit)
    end

    def test_negative_demand
      @asia.demand = -1;
      assert(-26, @asia.shortfall)
      assert(-10, @asia.profit)
    end

    def test_empty_string_demand
      skip
      @asia.demand = nil
      assert(Float::NAN, @asia.shortfall)
      assert(Float::NAN, @asia.profit)
    end
  end

  describe 'no producers' do
    def setup
      data = { 
        name: "No producers",
        producers: [],
        demand: 30,
        price: 20
      }
      @no_producers = Province.new(data)
    end

    def test_shortfall
      assert(30, @no_producers.shortfall)
    end

    def test_profit
      assert(0, @no_producers.profit)
    end

  end

  describe 'string for producers' do
    def test_string
      data = { 
        name: "String producers",
        producers: "",
        demand: 30,
        price: 20
      }
      const @prov = Province.new(data)
      assert(0, @prov.shortfall)
    end
  end

end
