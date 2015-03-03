class AccountRegion < ActiveRecord::Base
  extend Enumerize
  belongs_to :account

  enumerize :region, in: ['ap-northeast-1']
end
