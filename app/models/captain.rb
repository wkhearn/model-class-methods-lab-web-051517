class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    self.joins(boats: :classifications).where("classifications.name": "Catamaran")
  end

  def self.sailors
    self.joins(boats: :classifications).where("classifications.name": "Sailboat").uniq
  end

  def self.talented_seamen
    self.joins(boats: :classifications).where("classifications.name": "Motorboat").where(id: self.sailors)
  end

  def self.non_sailors
    self.joins(boats: :classifications).where.not(id: self.sailors).uniq
  end
end
