Serialize an array in one column.

 - [] when not set
 - `xxx_as_text` / `xxx_as_text=` accessors to edit in forms
 - `:on_set` callback for cleanup
 - stores NULL when given array was empty (all empty -> `IS NULL`)

Install
=======
 - As Rails plugin: `script/plugin install git://github.com/grosser/ar_serialized_array.git `
 - As gem: ` sudo gem install ar_serialized_array `


Usage
=====

    class User < ActiveRecord::Base
      serialized_array :product_ids, :accessor => :product_ids_as_text, :on_set=>lambda{|x| x.map(&:to_i).uniq }
    end

    User.new.product_ids        # []

    user.product_ids_as_text = "1, , 12323   , 23, 1"
    user.product_ids            # [1, 12323, 23]
    user.product_ids_as_text    # "1, 12323, 23"

    f.text_area :product_ids_as_text

    filled = User.all(:conditions => {:product_ids=>[1,3].to_yaml})
    empty = User.all(:conditions => {:product_ids=>nil})

TODO
====
 - add support for `user.product_ids << 1`

Author
======
[Michael Grosser](http://pragmatig.wordpress.com)  
grosser.michael@gmail.com  
Hereby placed under public domain, do what you want, just do not hold me accountable...
