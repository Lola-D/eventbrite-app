class AttendancesController < ApplicationController

  def new
    @attendance = Attendance.new
    @event = Event.find(params['id'])
  end

  def create
    @event = Event.find(params['event_id'])
    @attendance = Attendance.create(stripe_customer_id: current_user.id, event_id: params['event_id'], participant_id: params['participant_id'])

    if @attendance.save
      flash[:success] = "Le paiement à bien été effectué !"
      redirect_to event_path(@event.id)
    else
      flash[:danger] = "Le paiement n'a pas été effectué"
      redirect_to event_path(@event.id)


    @amount = @event.price
    customer = Stripe::Customer.create({ email: params[:stripeEmail],
                                        source: params[:stripeToken], })
    charge = Stripe::Charge.create({ customer: customer.id,
                                    amount: @amount,
                                    description: 'Rails Stripe customer',
                                    currency: 'eur', })
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to event_path(@event.id)
  end

  private

  def attendance_params
    @stripe_customer_id = current_user.id
    params.require(:attendance).permit(:stripe_customer_id, :event, :participant)
  end

end
