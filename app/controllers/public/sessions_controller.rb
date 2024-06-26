# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
def after_sign_in_path_for(resource) #会員のログイン後の遷移先
    root_path
  end

  def after_sign_out_path_for(resource) #会員のログアウト後の遷移先
    root_path
  end
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  private
# アクティブであるかを判断するメソッド
  def customer_state
  # 【処理内容1】 入力されたemailからアカウントを1件取得
  customer = Customer.find_by(email: params[:customer][:email])
  # 処理内容2
  # customer.nil?ではないことに注意, ここではcustomerが存在する場合に後続の処理を実行したいため
      if customer
    # 処理内容3
    # unlessではないことに注意, ここではパスワードが正しい場合に後続の処理を実行したいため
      if customer.valid_password?(params[:customer][:password])
      #処理内容４
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください"
        redirect_to new_customer_registration_path
      else
        flash[:notice] = "項目を入力してください"
      end
      else
      flash[:notice] = "該当するユーザーが見つかりません"
      end
  end
end
