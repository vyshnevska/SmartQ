module StoreLocation
  extend ActiveSupport::Concern

  included do
    before_action :store_user_address, :only => [:create]
  end

   def store_user_address
    current_user.ip = request.ip
    current_user.location = request.location.data.to_hash.slice('country_code', 'region_code', 'city', 'zip_code', 'latitude', 'longitude')
    current_user.save
  end

  protected
    def after_sign_in_path_for(resource)
      signed_in_root_path(resource)
    end

    # def after_sign_up_path_for(resource)
    #   signed_in_root_path(resource)
    # end

    # def after_inactive_sign_up_path_for(resource)
    # end
end