class Title < ActiveRecord::Base
    has_many:questions, :dependent => :delete_all
    validates:title,
        presence:true,
        length:{minimum:1,maximum:200}
end
