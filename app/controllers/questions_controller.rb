class QuestionsController < ApplicationController
    before_action :check_logined,  only: [:index , :new, :delete, :add, :create,:q_delete]
     #TODO mail
    
 def index
     #問一覧表示
     @title  = Title.new
     @titles = Title.where(user_id:session[:usr]).order('id desc')
  end

  def login
  end
    
  def show
  end

  def new     
      #回答一覧表示
      @title = Title.find(params[:no])  rescue nil
      #権限チェック
      if check_auth(@title) then
          @no = params[:no]
          @questions = Question.where(title_id:params[:no]).order('id desc')
          @question = Question.new
          @delete = Title.new
      end
  end

  def delete      
      #問　回答削除
      title = Title.find(params[:id])  rescue nil
      #権限チェック
      if check_auth(title) then
          title.destroy
          redirect_to controller: 'questions', action: 'index'
      end
  end

  def q_delete      
      #回答削除
      question = Question.find(params[:id])  rescue nil
      #権限チェック
      if question != nil then
          title = Title.find(question[:title_id])  rescue nil
          if check_auth(title) then
              question.destroy
              redirect_to controller: 'questions', action: 'new', no: title[:id]
          end
      end
  end
    
  def add
      #問追加
      @title = Title.new()
      @title.title = params[:title][:title]
      @title.user_id = session[:usr]
      @title.save  
      redirect_to controller: 'questions', action: 'index'
  end

    def create
        #回答登録
      @no = params[:question][:no]
      @question = Question.new
      @question.title_id = params[:question][:no]
      @question.content = params[:question][:content]
      @question.save  
      redirect_to controller: 'questions', action: 'new', no: @no
  end

    def regist
        #会員登録
        usrchk = User.find_by(username: params[:username])
        logger.debug(usrchk)
        if usrchk != nil then
            @registerror = 'ユーザ名は使用できません'
            render 'login'
        else    
            User.regist(params[:username],params[:password],params[:email])
            usr = User.authenticate(params[:username],params[:password])
            session[:usr] = usr.id        
            redirect_to controller: 'questions', action: 'index'
        end
    end

    def auth
        #認証処理
        usr = User.authenticate(params[:username],params[:password])
        if usr then
            reset_session
            session[:usr] = usr.id
            #全部Indexに飛ばす
            #redirect_to params[:referer]
            redirect_to controller: 'questions', action: 'index'
        else
            flash.now[:referer] = params[:referer]
            @error= 'ユーザ名/パスワードが間違っています'
            render 'login'
        end
    end
        
    def logout
        #ログアウト
        reset_session
        redirect_to controller: 'questions', action: 'index'
    end    

    def output_csv
      #CSV出力権限チェック
      title = Title.find(params[:no])  rescue nil
      #権限チェック
      if check_auth(title) == false then  
          return false
      end        
    end    

    private 
        def check_auth(title)
            #権限チェック
            user = title[:user_id] rescue 0 
            if session[:usr] != user then
                redirect_to  controller: :questions ,action: :index  
                return false
            end
            return true
        end
            
        def check_logined
        #セッションチェック
        if session[:usr] then
            #存在する場合userテーブル検索
            begin
                @user = User.find(session[:usr])
                #ユーザが存在しない場合セッション破棄
                rescue ActiveRecord::RecordNotFound
                reset_session
            end
        end
    unless @user
        flash[:referer] = request.fullpath
        redirect_to controller: :questions ,action: :login
    end
    end
end
