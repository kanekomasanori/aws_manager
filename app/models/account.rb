class Account < ActiveRecord::Base
  has_many :servers
  has_many :account_regions
  accepts_nested_attributes_for :account_regions
end
