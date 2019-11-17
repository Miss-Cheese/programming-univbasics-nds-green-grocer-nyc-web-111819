def find_item_by_name_in_collection(name, collection)

collection.each {|cart_item|
  if cart_item[:item] == name
    return cart_item
  end
}
nil
end

def consolidation_method(uniq_product, new_cart)
    cart_item_name = uniq_product[:item]

    index = 0
    while index < new_cart.count do
    if cart_item_name == new_cart[index][:item]
      return new_cart[index]
    end

    index += 1
    end
  new_cart << uniq_product
  uniq_product[:count] = 0
  uniq_product
end


def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  index = 0
  new_cart_array = []

  while index < cart.count do
    cart_item_name = cart[index][:item]
    cart_item = cart[index]

    new_cart_hash = consolidation_method(cart_item,new_cart_array)

    new_cart_hash[:count] += 1
    index += 1

  end

  new_cart_array
end

def apply_coupon_to_cart(consolidated_cart, coupon)

  consolidated_cart.each {|cart_item|
    if cart_item[:item] == coupon[:item]
      if cart_item[:count] >= coupon[:num]
        consolidated_cart << {
          :item => "#{cart_item[:item]} W/COUPON",
          :price => coupon[:cost]/coupon[:num],
          :clearance => cart_item[:clearance],
          :count => coupon[:num]
        }
        cart_item[:count] = cart_item[:count] - coupon[:num]
      end
    end
  }
  consolidated_cart
end


def apply_coupons(consolidated_cart, coupons)

  coupons.each {|coupon|
  consolidated_cart = apply_coupon_to_cart(consolidated_cart, coupon)
  }

  consolidated_cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart


cart.each {|item|
  puts "1---------------"
   pp item[:clearance] = true
   puts "2---------------"

}





end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
