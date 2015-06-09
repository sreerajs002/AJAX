class Product < ActiveRecord::Base
	validates :name,:cost, :presence => true
	validates :cost, :numericality => true
end
