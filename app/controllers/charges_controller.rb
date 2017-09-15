class ChargesController < ApplicationController

  def new
  end

  def create
    if params["selected_challenges"].empty?
      flash[:notice] = "You need to filter challenges first on order to purchase."
      redirect_to nlbc_trainers_path
    else
      begin
        challenges = Challenge.where(id: params["selected_challenges"].split(','))
        # Amount in cents NOTE update from params!!!!!!!!!
        @show_amount = challenges.map{|challenge| challenge.price}.compact.inject(:+)
        @amount = @show_amount * 100
        @challenges = challenges

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
  end

end
