class Product < ActiveRecord::Base
  def self.sellect_list
    result = []
    all.each do |proudct|
      result << [proudct.sku, proudct.id]
    end
    result
  end
end
