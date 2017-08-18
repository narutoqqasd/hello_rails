require 'rails_helper'

RSpec.describe Cart, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  describe "购物车基本功能" do 
  	it "可以把商品丢到购物车里，然后购物车里就有东西了" do 
  		cart = Cart.new 
  		cart.add_item 1 
  		expect(cart.empty?).to be false 
  	end 


  	it "如果加了相同种类的商品到购物车里，购买项目(CartItem)并不会增加，但商品的数量会改变" do 
  		cart = Cart.new 
  		3.times { cart.add_item(1) }
  		5.times { cart.add_item(2) }
  		2.times { cart.add_item(3) }
  		expect(cart.items.length).to be 3 
  		expect(cart.items.first.quantity).to be 3 
  		expect(cart.items.second.quantity).to be 5
  	end 


  	it "商品可以放到购物车里，也可以再拿出来" do 
  		cart = Cart.new 
  		p1 = Product.create(title: "七龙珠")
  		p2 = Product.create(title: "火影忍者")
  		4.times { cart.add_item(p1.id) }
  		2.times { cart.add_item(p2.id) }
  		expect(cart.items.first.product_id).to be p1.id 
  		expect(cart.items.second.product_id).to be p2.id 
  		expect(cart.items.first.product).to be_a Product 
  	end 


  	
  	it "可以计算整台购物车的总消费金额" do 
  		cart = Cart.new 
  		p1 = Product.create(title: "七龙珠")
  		p2 = Product.create(title: "火影忍者")
  		3.times { 
  			cart.add_item(p1.id) }
  			cart.add_item(p2.id) }
  		}

  		expect(cart.total_price).to be 840 
  	end 


  	it "特别活动可能可搭配折扣(例如圣诞节的时候全面打9折，或是满额满千送百)"
  end 

  describe "购物车进阶功能" do 
  	it "可以将购物车内容转换成Hash，存到Session里" do 
  		cart = Cart.new 
  		3.times { cart.add_item(2) }
  		4.times { cart.add_item(5) }
  		expect(cart.serialize).to eq session_hash
  	end 


  	it "可以把Session的内容(Hash格式)，还原成购物车的内容" do 
  		cart = Cart.from_hash(session_hash)
      expect(cart.items.first.product_id).to be 2
      expect(cart.items.first.quantity).to be 3
      expect(cart.items.second.product_id).to be 5
      expect(cart.items.second.quantity).to be 4
  	end 
  end 

  private 
  def session_hash 
  	{
  		"items" => [
  			{"product_id" => 2, "quantity" => 3},
  			{"product_id" => 5, "quantity" => 4}
  		]
  	}
  end 

end
