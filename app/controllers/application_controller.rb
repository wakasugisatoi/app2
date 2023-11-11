class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?
  #devise利用の機能（ユーザ登録、ログイン認証など）が使われる前にconfigure_permitted_parametersメソッドが実行される
  
  def after_sign_in_path_for(resource)
    post_images_path
  end 
  
   
  def after_sign_out_path_for(resource)
    about_path
  end
  
  protected
  
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email])  #sign_upの際に、nameのデータ操作を許可
  end
  
end
