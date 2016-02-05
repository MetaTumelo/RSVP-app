class Guest < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true

  has_many :plusones, dependent: :destroy
  accepts_nested_attributes_for :plusones, :reject_if=> proc {|attributes| attributes[:name].blank?}, :allow_destroy => true

  
  has_one :detail, dependent: :destroy
  accepts_nested_attributes_for :detail, reject_if: :all_blank, :allow_destroy => true

end
