class AttendancesController < ApplicationController

  def new
    @attendance = Attendance.new
    @event = Event.find(params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])
    @amount = @event.price * 100
    @attendance = Attendance.create(event_id: @event.id, participant_id: current_user.id, stripe_customer_id: current_user.id)

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Paiement évènement',
      currency: 'eur',
    })

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_event_attendance(@event.id)

  end

end
