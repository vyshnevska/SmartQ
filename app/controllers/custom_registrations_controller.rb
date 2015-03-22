class CustomRegistrationsController < Devise::RegistrationsController
  include StoreLocation
end