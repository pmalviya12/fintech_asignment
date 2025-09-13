class EmailTemplate < ApplicationRecord
  validates :subject, :body, presence: true

  def render_for(contact)
    rendered = body.dup

    best_perf = if contact.best_portfolio
                  format_number(contact.best_portfolio.performance)
                else
                  'N/A'
                end

    worst_perf = if contact.worst_portfolio
                   format_number(contact.worst_portfolio.performance)
                 else
                   'N/A'
                 end

    replacements = {
      "{Contact.name}" => contact.name.to_s,
      "{Contact.email}" => contact.email.to_s,
      "{Organization.name}" => contact.organization&.name.to_s,
      "{Organization.email}" => contact.organization&.email.to_s,
      "{Portfolio.best_performance}" => best_perf,
      "{Portfolio.worst_performance}" => worst_perf
    }

    replacements.each { |k, v| rendered.gsub!(k, v) }

    # subject may also contain shortcodes
    rendered_subject = subject.dup
    replacements.each { |k, v| rendered_subject.gsub!(k, v) }

    { subject: rendered_subject, body: rendered }
  end

  private

  def format_number(num)
    if num.nil?
      'N/A'
    else
      f = num.to_f
      if f == f.to_i
        f.to_i.to_s
      else
        sprintf('%.2f', f).sub(/\.?0+$/, '')
      end
    end
  end
end