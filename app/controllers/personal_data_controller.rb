class PersonalDataController < ApplicationController
  def index
  end

  def create
    @personal_data = PersonalData.new(personal_data_params)

    respond_to do |format|
      if @personal_data.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.remove('personal-data-form') +
                                turbo_stream.update(
                                  'employment-modal',
                                  partial: 'employments/employment_modal',
                                  locals: { personal_data_id: @personal_data.id }
                                )

        end
      else
        flash[:alert] = "The record is already present in the database. Please provide new details."
        format.html { redirect_to new_personal_datum_path }
      end
    end

  end

  def new
    @personal_data = PersonalData.new
  end

  private

  def personal_data_params
    params.require(:personal_data).permit(:first_name, :last_name, :nickname, :email, :phone)
  end
end
