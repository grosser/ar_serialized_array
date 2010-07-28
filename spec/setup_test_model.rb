# connect
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => ":memory:"
)

# create tables
ActiveRecord::Schema.define(:version => 1) do
  create_table :users do |t|
    t.string :product_ids
  end
end

# create models
class User < ActiveRecord::Base
  serialized_array :product_ids, :accessor => :product_ids_as_text, :on_set=>lambda{|x| x.map(&:to_i).uniq}
end

class UserWithAccessor < ActiveRecord::Base
  self.table_name = 'users'
  serialized_array :product_ids, :accessor => :product_ids_as_text
end


class UserPlain < ActiveRecord::Base
  self.table_name = 'users'
  serialized_array :product_ids
end