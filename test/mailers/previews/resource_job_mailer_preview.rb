# Preview all emails at http://localhost:3000/rails/mailers/resource_job_mailer
class ResourceJobMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/resource_job_mailer/created
  def created
    ResourceJobMailer.created
  end

end
