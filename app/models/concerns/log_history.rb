module LogHistory
  extend ActiveSupport::Concern

  included do
    before_destroy :log_to_history
  end

  def log_to_history
    Log.create(
        table_name: self.class.name,
        action:     'delete',
        deleted_id: self.id,
        content:    self.to_yaml,
        deleted_at: Time.now,
        deleted_by: User.current_user.id || 0
      )
  end
end
