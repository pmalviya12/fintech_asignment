class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
    @templates = EmailTemplate.all
  end

  def preview_email
    @contact = Contact.find(params[:id])
    @template = EmailTemplate.find(params[:template_id])

    @preview_subject = replace_shortcodes(@template.subject, @contact)
    @preview_body = replace_shortcodes(@template.body, @contact)
  end

  def send_email
    @contact = Contact.find(params[:id])
    @template = EmailTemplate.find(params[:template_id])

    flash[:notice] = "Email sent to #{@contact.email} using template: #{@template.subject}"
    redirect_to contacts_path
  end

  private

  def replace_shortcodes(text, contact)
    text
      .gsub("{Contact.name}", contact.name.to_s)
      .gsub("{Contact.email}", contact.email.to_s)
      .gsub("{Organization.name}", contact.organization&.name.to_s)
      .gsub("{Organization.email}", contact.organization&.email.to_s)
      .gsub("{Portfolio.best_performance}", contact.best_portfolio&.performance.to_s)
      .gsub("{Portfolio.worst_performance}", contact.worst_portfolio&.performance.to_s)
  end
end
