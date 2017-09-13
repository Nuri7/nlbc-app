class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents NOTE update from params!!!!!!!!!
    @amount = 500

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => "Rails Stripe customer: customerID: #{customer.id}, customerEmail: #{params[:stripeEmail]} is paying for User-teacherEmail: #{params['trainer_email']} with ID #{params['trainer_id']}",
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
