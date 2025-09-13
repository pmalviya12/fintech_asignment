class EmailTemplatesController < ApplicationController

  def index
    @templates = EmailTemplate.all
  end

  def show
    @template = EmailTemplate.find(params[:id])
  end

  def new
    @template = EmailTemplate.new
  end

  def create
    @template = EmailTemplate.new(template_params)
    if @template.save
      redirect_to email_templates_path
    else
      render :new
    end
  end

  def edit
    @template = EmailTemplate.find(params[:id])
  end

  def update
    @template = EmailTemplate.find(params[:id])
    if @template.update(template_params)
      redirect_to email_templates_path
    else
      render :edit
    end
  end

  def destroy
    @template = EmailTemplate.find(params[:id])
    @template.destroy
    redirect_to email_templates_path
  end

  def preview
    @template = EmailTemplate.find(params[:id])
    @contact = Contact.first
    @preview_subject = replace_shortcodes(@template.subject, @contact)
    @preview_body = replace_shortcodes(@template.body, @contact)
  end

  private

  def template_params
    params.require(:email_template).permit(:subject, :body)
  end

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
