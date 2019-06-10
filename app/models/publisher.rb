class Publisher < ApplicationRecord
  after_initialize :set_uuid

  def to_param
    uuid
  end

  private

  def set_uuid
    self.uuid ||= SecureRandom.uuid
  end
end
