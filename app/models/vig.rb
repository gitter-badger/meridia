class Vig
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :date, type: String
  field :status, type: Integer
  field	:abvd, type: Hash,default: {total: -1}
  field	:aivd, type: Hash, default: {total: -1}
  field :tinetti, type: Hash, default: {total: -1,total2: -1}
  field :folstein, type: Hash,default: {total: -1}
  field :yesavage, type: Hash,default: {total: -1}
  field :hamilton, type: Hash, default: {total: -1 ,total2: -1}
  field :nutrition, type: Hash,default: {total: -1}
  field :oars, type: Hash,default: {total: -1}
  field :kind, type: Symbol, default: :gerontology

  belongs_to :member
  has_one :probien
  has_and_belongs_to_many  :tests
  has_many :answers
  has_many :vigs_tests

	scope :withot_nursing,-> { where :kind => "gerontology"}	

  def self.test_applicate(list)
    res = [] 
    current = [0,0,0,0,0,0]
    last  = [0,0,0,0,0,0]
    list.each do |vig|
      vig.vigs_tests.each do |test|
        case test.test.code
        when 1
          if current[0] == 0
            current[0] = vig.abvd["total"]
          elsif last[0] == 0
            last[0]= vig.abvd["total"]
          end
        when 2
          if current[1] == 0
            current[1] = vig.aivd["total"]
          elsif last[1] == 0
            last[1]= vig.abvd["total"]
          end
        when 3
          if current[2] == 0
            test["folstein"]= vig.folstein["total"]
          elsif
            last[2]= vig.abvd["total"]
          end
        when 4
          if current[3] == 0
            test["yesavage"]= vig.yesavage["total"]
          elsif
            last[3]= vig.abvd["total"]
          end
        when 6
          if current[4] == 0
            test["tinetti"]= vig.tinetti["total"]
          elsif
            last[4]= vig.abvd["total"]
          end
        when 7
          if current[5] == 0
            test["hamilton"]= vig.hamilton["total"]
          elsif
            last[5]= vig.abvd["total"]
          end
        end  
      end
    end
    res =[current,last]
  end

end
