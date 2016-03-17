class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      if params[:plan]
        resource.plan_id == 2
        if resource.plan_id == 2
          resource.save_with_payment
        else
          resouce.save
        end
      end
    end
  end
  
end
