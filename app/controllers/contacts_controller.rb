class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = "Thank You for contacting us."
      redirect_to :back
    else
      flash[:error] = "Something went wrong. Please try again."
      redirect_to :back
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :work_phone, :organization_name, :employees_number, :comments, :req_type)
  end
end
