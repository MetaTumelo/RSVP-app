class GuestForm < ActionForm::Base
  self.main_model = :guest

  attributes :status, :name, :message

  association :plusones do
    attributes :name, :oldness
  end 

  association :detail do
    attributes :bride, :groom, :date
  end 

end