require 'rails_helper'

RSpec.describe CartItem, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  it "每个Cart Item都可以计算它自己的金额(小计)" do 
  	p1 = Product.create(title: "七龙珠", price: 80)
  	p2 = Product.create(title: "火影忍者", price: 200)

  	cart = Cart.new 
  	3.times { cart.add_item(p1.id) }
  	4.times { cart.add_item(p2.id) }
  	2.times { cart.add_item(p1.id) }

  	expect(cart.items.first.price).to be 400 
  	expect(cart.items.second.price).to be 800
  end 
end
