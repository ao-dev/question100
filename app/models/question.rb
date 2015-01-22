class Question < ActiveRecord::Base
    belongs_to:title
    validates:content,
        presence:true,
        length:{minimum:1,maximum:200}
end
