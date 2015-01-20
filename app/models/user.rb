class User < ActiveRecord::Base
    def self.authenticate(username,password)
        usr = find_by(username: username)
        if usr != nil &&
            usr.password == Digest::SHA1.hexdigest(usr.salt + password) then
                usr
            else
                return
            end
        end
        
        def self.regist(username,password,email)            
            usr = User.new
            usr.username  = username
            usr.email = email
            usr.salt  = 'hoge'
            usr.password = Digest::SHA1.hexdigest(usr.salt + password)
            usr.save
        end
end
