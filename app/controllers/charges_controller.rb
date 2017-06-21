class ChargesController < ApplicationController
  def new
  end

  def create
    customer = StripeTool.create_customer(
      email: params[:stripeEmail],
      stripe_token: params[:stripeToken]
    )

    charge = StripeTool.create_charge(
      customer_id: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'eur'
    )
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
