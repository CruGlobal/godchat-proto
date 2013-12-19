class Campaign < ActiveRecord::Base
  validates :name, :missionhub_secret, presence: true
	before_create :generate_code

	private

	def generate_code
		begin
			self.code = SecureRandom.hex(3)
		end while Campaign.exists?(code: code)
	end
end
