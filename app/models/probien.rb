class Probien
	include Mongoid::Document
	include Mongoid::Timestamps

	field :objetive, type: String
	field :cognitive, type: String
	field :health,  type: String
	field :physical, type: String
	field :personaldev, type: String
	field :social, type: String 
	field :observation, type: String
  field :open, type: Boolean, default: true
  ## Probien result
  field	:abvd, type: Hash,default: {total: -1}
  field	:aivd, type: Hash, default: {total: -1}
  field :tinetti, type: Hash, default: {total: -1,total2: -1}
  field :folstein, type: Hash,default: {total: -1}
  field :yesavage, type: Hash,default: {total: -1}
  field :hamilton, type: Hash, default: {total: -1 ,total2: -1}
  field :nutrition, type: Hash,default: {total: -1}
  field :oars, type: Hash,default: {total: -1}
  field :mmse, type: Hash,default: {total: -1}

	has_many :vigs
	belongs_to :member
	embeds_many :descriptions
	accepts_nested_attributes_for :descriptions, :allow_destroy => true
  scope :open,-> {where(open: true)}
  scope :close, ->{where(open: false)}
  def set_probien(vigs)  
    vigs.each do |vig|
      self.abvd = vig.abvd
      self.aivd = vig.aivd
      self.tinetti = vig.tinetti
      self.folstein = vig.folstein
      self.yesavage = vig.yesavage
      self.hamilton = vig.hamilton
      self.nutrition = vig.nutrition
      self.oars = vig.oars
      self.update
      vig.update_attributes(:status => false)
    end
  end


end
