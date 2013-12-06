class TokensController  < ApplicationController
    skip_before_filter :verify_authenticity_token
    respond_to :json
    
    def create
    email = params[:email]
    password = params[:password]
    first_name = params[:first_name]
    last_name = params[:last_name]
    
    if not email.nil?
      find_user_by_email
      puts "user"
      puts @user
      if @user.nil?
        logger.info("Failed signin, user cannot be found.")
        render :status=>401, :json=>{:message=>"Invalid credentials."}
        return
      end
    
      if not @user.valid_password?(password)
        logger.info("User #{email} failed signin, password \"#{password}\" is invalid")
        render :status=>401, :json=>{:message=>"Invalid email or password."}
        return
      end
    end
        
    # http://rdoc.info/github/plataformatec/devise/master/Devise/Models/TokenAuthenticatable
    @user.ensure_authentication_token!
 
      render :status=>200, :json=>{:token=>@user.authentication_token,
        :first_name => @user.first_name,
        :last_name => @user.last_name
      }
  end
 
  def destroy
    find_user_by_token
    
    if @user.nil?
      logger.info("Token not found.")
      render :status=>404, :json=>{:message=>"Invalid token."}
    else
      @user.reset_authentication_token!
      render :status=>200, :json=>{:token=>params[:id]}
    end
  end
  
  private
    def find_user_by_email     
      @user=User.find_by_email(params[:email])
    end
    
    def find_user_by_token
      @user=User.find_by_authentication_token(params[:id])
    end
    

    def auth_params
      params.permit(:email, :password, :first_name, :last_name)
    end
 
end