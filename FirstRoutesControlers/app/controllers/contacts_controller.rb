class ContactsController < ApplicationController
  def index
    owning_user = User.find(params[:user_id])
    if owning_user.nil?
      render status: :not_found
    else
      contacts = owning_user.contacts
      shared_contacts = owning_user.shared_contacts
      render json: {owned: contacts, shared: shared_contacts}
    end
  end

  def show
    contact = Contact.find(params[:id])
    if contact.nil?
      render status: :not_found
    else
      render json: contact
    end
  end

  def update
    contact = Contact.find(params[:id])

    if contact.nil?
      render status: :not_found
    else
      if contact.update(contact_params)
        render json: contact
      else
        render_error(contact)
      end
    end
  end
  #
  def create
    contact = Contact.new (contact_params)
    if contact.save
      render json: Contact.all
    else
      render_error(contact)
    end
  end

  def destroy
    contact = Contact.find(params[:id])

    if contact.nil?
      render status: :not_found
    else
      contact.destroy
      render json: contact
    end
  end
  #
  private

  def render_error(contact)
    render json: contact.errors.full_messages,
          status: :unprocessable_entity

  end

  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
