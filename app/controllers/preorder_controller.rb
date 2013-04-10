class PreorderController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :ipn

  def index
  end

  def prefill
    payment_option_id = params['payment_option']
    redirect_to :action => "checkout", :option => payment_option_id
  end

  def checkout
    payment_option_id = params[:option]
  end

  def postfill!
    @user = User.find_or_create_by_email!(params[:email])
    redirect_to root_url unless params[:stripe_token]

    # Create a Stripe customer that we can charge later, and
    # attach the customer ID to the User object.
    customer = Stripe::Customer.create(
      :description => "Customer for #{params[:email]}",
      :email => params[:email],
      :card => params[:stripe_token]
    )

    if Settings.use_payment_options
      payment_option_id = params[:payment_option]
      raise Exception.new("No payment option was selected") if payment_option_id.nil?
      payment_option = PaymentOption.find(payment_option_id)
      price = payment_option.amount
    else
      price = Settings.price
    end

    # Create an order for this user.
    @order = Order.generate
    @order.stripe_customer_id = customer.id
    @order.name = Settings.product_name
    @order.price = price
    @order.user_id = @user.id
    @order.address_line1 = params[:address_line1]
    @order.address_line2 = params[:address_line2]
    @order.city = params[:city]
    @order.state = params[:state]
    @order.phone = params[:phone]
    @order.zip = params[:address_zip]
    @order.country = params[:country]
    @order.payment_option_id = payment_option_id
    @order.save!

    Notifier.donate_email(customer, payment_option).deliver

    redirect_to root_url
  end

  def share
    @order = Order.find_by_uuid(params[:uuid])
  end
end