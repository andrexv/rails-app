class Job < ApplicationRecord

  def self.send_mail
    JobMailer.created
  end
end
