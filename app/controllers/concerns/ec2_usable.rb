require 'aws-sdk'

module EC2Usable
  extend ActiveSupport::Concern

  def obtain_instances(account_id, region)
    account = Account.find(account_id)
    Aws.config.update({
      region: region,
      credentials: Aws::Credentials.new(account.access_key_id, account.secret_access_key),
    })
    binding.pry
    ec2 = Aws::EC2::Client.new
    @instances = []
    @instances << ec2.describe_instances.reservations.map(&:instances)
    @instances.flatten
  end
end
