class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to new_contact_path, notice: '※メッセージが送信されました'

    else
      redirect_to new_contact_path
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :message)
  end
end
