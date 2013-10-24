module Utils
  def self.round(price)
    return price if price % 5 == 0
    price + 5 - (price % 5)
  end

  def self.format_price(price)
    sprintf("%.2f", price / 100.00)
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
    @price = price * 100
    @import = import
  end

  def get_taxes

    the_tax = 0

    if @type != "medicine" && @type != "food" && @type != "book"
      the_tax += 0.1
    end

    if import == true
      the_tax += 0.05
    end

    return Utils::round(@price * the_tax).ceil

  end

end 

class Receipt
  
  def initialize(*goodstobecalc)

      @goodstobecalc = goodstobecalc
  end

  def print_receipt

    @total_of_taxes = 0
    @item_with_taxes = 0
    @total = 0
    
    @goodstobecalc.each do |indiv_good|
      tax_on_item = indiv_good.get_taxes
      @total_of_taxes += tax_on_item
      @item_with_taxes = indiv_good.price + tax_on_item
      @total += @item_with_taxes
      puts "#{indiv_good.quantity} " + indiv_good.name + " #{Utils.format_price(@item_with_taxes)}"
    end

      puts "Sales Taxes: " + "#{Utils::format_price(@total_of_taxes)}"
      puts "Total: " + "#{Utils::format_price(@total)}"
  end

end

book = Good.new(1, "Book", "book", 12.49, false)
music_CD = Good.new(1, "Music CD", "music", 14.99, false)
chocolate = Good.new(1, "Chocolate Bar", "food", 0.85, false)
box_of_chocolates = Good.new(1, "Box of Imported Chocolates", "food", 10.00, true)
bottle_of_perfume = Good.new(1, "Bottle of Imported Perfume", "perfume", 47.50, true)
bottle_of_perfume2 = Good.new(1, "Bottle of Imported Perfume", "perfume", 27.99, true)
bottle_of_perfume3 = Good.new(1, "Bottle of  Perfume", "perfume", 18.99, false  )
headache_pills = Good.new(1, "Bottle of Headache Pills", "medicine", 9.75, false)
chocolates_2 = Good.new(1, "Box of Imported Chocolates","food", 11.25, true)

receipt_1 = Receipt.new(book, music_CD, chocolate)
receipt_2 = Receipt.new(box_of_chocolates, bottle_of_perfume)
receipt_3 = Receipt.new(bottle_of_perfume2, bottle_of_perfume3, headache_pills, chocolates_2)

receipt_1.print_receipt
puts " ________________ "
receipt_2.print_receipt
puts " ________________ "
receipt_3.print_receipt