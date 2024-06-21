#寺田
module Public
  class Public::AddressesController < ApplicationController
    before_action :authenticate_customer!
    before_action :set_address, only: [:edit, :update, :destroy]

    def index
      @addresses = current_customer.addresses
      @address = Address.new
    end

    def create
      @address = Address.new(address_params)
      @address.customer_id = current_customer.id
      if @address.save
        redirect_to addresses_path, notice: '配送先が登録されました。'
      else
        @addresses = current_customer.addresses
        render :index
      end
    end

    def edit
    end

    def update
      if @address.update(address_params)
        redirect_to addresses_path, notice: '配送先が更新されました。'
      else
        @addresses = current_customer.addresses
        # @address =Address.find(params[:id])
        # puts @address.errors.full_messages
        render :edit
      end
    end

    def destroy
      @address.destroy
      redirect_to addresses_path, notice: '配送先が削除されました。'
    end

    private

    def set_address
      @address = Address.find(params[:id])
    end

    def address_params
      params.require(:address).permit(:name, :postal_code, :address)
    end
  end
end
