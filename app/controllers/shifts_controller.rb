class ShiftsController < ApplicationController
  def index
    @upcoming_shifts = Shift.where("date >= ?", Time.current).order(date: :asc)
    @past_shifts = Shift.where("date < ?", Time.current).order(date: :desc)

    render({ :template => "shifts/index" })
  end

  def shift
    the_id = params.fetch("path_id")

    matching_shifts = Shift.where({ :id => the_id})

    @the_shift = matching_shifts.at(0)

    # @dances = @the_show.dances

    render({ :template => "shifts/shift"})

  end

  def create
    the_shift = Shift.new
    the_shift.location = params.fetch("query_location")
    the_shift.date = params.fetch("query_date")

    if the_shift.valid?
      the_shift.save
      redirect_to("/shifts", { :notice => "Shift created successfully"})
    else 
      redirect_to("/shifts", { :alert => the_shift.errors.full_messages.to_sentence})
  end
end

  def update
    the_id = params.fetch("path_id")
    the_shift = Shift.where({ :id => the_id }).at(0)

    the_shift.shift_name = params.fetch("query_shift_name")
    the_shift.location = params.fetch("query_location")
    the_shift.date = params.fetch("query_date")

    if the_shift.valid?
      the_shift.save
      redirect_to("/shifts/#{the_shift.id}", { :notice => "Shift updated successfully."} )
    else
      redirect_to("/shifts/#{the_shift.id}", { :alert => the_shift.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_shift = Shift.where({ :id => the_id }).at(0)

    the_shift.destroy

    redirect_to("/shifts", { :notice => "Shift deleted successfully."} )
  end


end
