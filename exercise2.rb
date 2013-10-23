module Taxes

  def sales_tax(price)
    (price * 0.10).round(2)
  end

  def import_tax(price)
    (price * 0.05).round(2)
  end

end


class Good
  
  attr_reader :quantity
  attr_reader :name
  attr_reader :type
  attr_reader :price
  attr_reader :import

  def initialize(quantity, name, type, price, import)
    @quantity = quantity
    @name = name
    @type = type
    @price = price
    @import = import
  end

  def whatisit
    puts "#{quantity} #{@name} is a #{@type} with a price of #{@price}. Is it imported? #{@import}"
  end

end 

class Receipt
  
  include Taxes

  def initialize(*goodstobecalc)

      @goodstobecalc = goodstobecalc
  end

  def calc_taxes()

    @subtotal_taxes = 0
    
    @goodstobecalc.each do |indiv_good|
      #indiv_good.whatisit
        if indiv_good.type != "medicine" && indiv_good.type != "food" && indiv_good.type != "book"
          @subtotal_taxes += sales_tax(indiv_good.price)
        end
        if indiv_good.import == true
          @subtotal_taxes += import_tax(indiv_good.price)
        end
    end
  end

  def calc_total()
    
    @total = 0

    @goodstobecalc.each do |indiv_good|
      @total += indiv_good.price
    end

    @total += @subtotal_taxes
  end

  def print_receipt()

    @goodstobecalc.each do |indiv_good|
      print "#{indiv_good.quantity} #{indiv_good.name} : #{indiv_good.price} " 
    end

      print "Sales Taxes: #{@subtotal_taxes} Total #{@total.round(3)} "
  end

end

book = Good.new(1, "Book", "book", 12.49, false)
music_CD = Good.new(1, "Music CD", "music", 14.99, false)
chocolate = Good.new(1, "Chocolate Bar", "food", 0.85, false)

receipt_1 = Receipt.new(book, music_CD, chocolate)

receipt_1.calc_taxes()
receipt_1.calc_total()
receipt_1.print_receipt()

box_of_chocolates = Good.new(1, "Box of Chocolates", "food", 10.00, true)
bottle_of_perfume = Good.new(1, "Bottle of Perfume", "perfume", 47.50, true)

puts " "
puts " "

receipt_2 = Receipt.new(box_of_chocolates, bottle_of_perfume)

receipt_2.calc_taxes()
receipt_2.calc_total()
receipt_2.print_receipt()