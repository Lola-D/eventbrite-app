class ChargesController < ApplicationController

  def new
  end

  def create
    @event = Event.find(params[:attendance_id])

    @amount = @event.price
    customer = Stripe::Customer.create({ email: params[:stripeEmail],
                                         source: params[:stripeToken], })

    charge = Stripe::Charge.create({ customer: current_user.id,
                                    amount: @amount,
                                    description: 'Rails Stripe customer',
                                    currency: 'eur', })
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_attendance_charge_path
  
  end
  
end
