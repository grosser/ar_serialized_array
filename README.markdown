Serialize an array in a column, will be [] when no set.

 - can add `as_text` / `as_text=` accessors to edit in forms
 - can add `:on_set` callback for cleanup

Install
=======
 - As Rails plugin: `script/plugin install git://github.com/grosser/ar_serialized_array.git `
 - As gem: ` sudo gem install ar_serialized_array `


Usage
=====

    class User < ActiveRecord::Base
      serialized_array :product_ids, :accessor => :product_ids_as_text, :on_set=>lambda{|x| x.map(&:to_i).uniq}
    end

    User.new.product_ids        # []

    user.product_ids_as_text = "1, , 12323   , 23, 1"
    user.product_ids            # [1, 12323, 23]
    user.product_ids_as_text    # "1, 12323, 23"

    f.text_area :product_ids_as_text


Author
======
[Michael Grosser](http://pragmatig.wordpress.com)  
grosser.michael@gmail.com  
Hereby placed under public domain, do what you want, just do not hold me accountable...
