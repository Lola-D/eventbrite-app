class AttendancesController < ApplicationController

  def new
    @attendance = Attendance.new
    @event = Event.find(params['id'])
  end

  def create
    @event = Event.find(params['event_id'])
    @attendance = Attendances.create(attendance_params)
    if @attedance.save
      flash[:success] = "Le Commentaire a bien été créé !"
      redirect_to event_path(@event.id)
    else
      flash[:danger] = "Le Commentaire n'a pas été créé !"
      redirect_to event_path(@event.id)
    end

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
    params.require(:attendance).permit(:stripe_customer_id, :event, :participant)
  end

end
