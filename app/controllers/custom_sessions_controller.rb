class CustomSessionsController < Devise::SessionsController
  include StoreLocation
end