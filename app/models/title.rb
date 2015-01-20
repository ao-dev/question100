class Title < ActiveRecord::Base
    has_many:questions, :dependent => :delete_all
end
