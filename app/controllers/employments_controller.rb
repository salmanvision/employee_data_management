class EmploymentsController < ApplicationController
  def create
    @personal_data = PersonalData.find_by(id: employment_params[:personal_data_id])
    employment_params[:employer].each_with_index do |emp, index|
      @employment = Employment.new(employer: emp, date_started: employment_params[:date_started][index], date_ended: employment_params[:date_ended][index])
      @employment.personal_data_id = @personal_data.id
      @employment.save
    end

    flash[:notice] = "Personal and Employment data is added successfully."
    respond_to do |format|
      format.html { redirect_to personal_data_path }
    end
  end

  def add_employment
    helpers.fields model: Employment.new do |form|
      render turbo_stream: turbo_stream.append(
        'add-employment',
        partial: 'employments/employment_data_fields',
        locals: { form: form, first_employment: nil }
      )
    end
  end

  private

  def employment_params
    params.require(:employment).permit(:personal_data_id, employer: [], date_started: [], date_ended: [])
  end
end
