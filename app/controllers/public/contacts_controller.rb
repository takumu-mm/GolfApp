class Public::ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    respond_to do |format|
      if @contact.valid?
        session[:contact_params] = contact_params
        format.html { redirect_to confirmation_public_contacts_path }
        format.turbo_stream { redirect_to confirmation_public_contacts_path }
      else
        format.html { render :new }
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace("errors", partial: "public/contacts/errors", locals: { contact: @contact }),
            turbo_stream.replace("contact_form", partial: "public/contacts/form", locals: { contact: @contact })
          ]
        end
      end
    end
  end

  def confirmation
    if session[:contact_params]
      @contact = Contact.new(session[:contact_params])
      render :confirmation
    else
      redirect_to new_public_contact_path, alert: "セッションが失効しました。もう一度やり直してください。"
    end
  end


  def back
    if params[:contact].present?
      @contact = Contact.new(contact_params)
    else
      @contact = Contact.new
    end
    render :new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to done_public_contacts_path
    else
      flash[:alert] = @contact.errors.full_messages.join(", ")
      @contact = Contact.new
      render :new
    end
  end

  def done;end

  private

    def contact_params
      params.require(:contact).permit(:name, :email, :subject, :message)
    end
end
