Serialize an array in one column.

 - [] when not set
 - `xxx_as_text` / `xxx_as_text=` accessors to edit in forms
 - `:on_set` callback for cleanup
 - stores NULL when given array was empty (all empty -> `IS NULL`)

Install
=======
 - As Rails plugin: `rails plugin install git://github.com/grosser/ar_serialized_array.git `
 - As gem: ` sudo gem install ar_serialized_array `


Usage
=====

    # basic / forms
    class User < ActiveRecord::Base
      serialized_array :product_ids, :accessor => :product_ids_as_text
    end

    <%= form_for @user do |f| %>
      <%= f.text_field :product_ids_as_text %>
    <% end %>

    # set / get
    User.new.product_ids        # []

    user.product_ids_as_text = "1, , 12323   , 23, 1"
    user.product_ids            # [1, 12323, 23]
    user.product_ids_as_text    # "1, 12323, 23"

    # find ...
    filled = User.all(:conditions => {:product_ids=>[1,3].to_yaml})
    empty = User.all(:conditions => {:product_ids=>nil})

    # with cleanup (unique integers)
    class User < ActiveRecord::Base
      serialized_array :product_ids, :on_set=>lambda{|x| x.map(&:to_i).uniq }
    end

TODO
====
 - add support for `user.product_ids << 1`


Author
======
[Michael Grosser](http://grosser.it)
michael@grosser.it
Hereby placed under public domain, do what you want, just do not hold me accountable...
