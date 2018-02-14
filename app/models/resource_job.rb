class ResourceJob < ApplicationRecord

  def self.send_mail
    ResourceJobMailer.created.deliver_later
  end
end
