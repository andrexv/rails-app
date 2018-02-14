class ResourceJobMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.resource_job_mailer.created.subject
  #
  def created
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
