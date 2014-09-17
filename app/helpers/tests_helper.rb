module TestsHelper
  def sings sings
    attr = []
    ta = []
    fc = []
    fr = []

    sings.each do |sign|
      data1 =[]
      data2 =[]
      data3 =[]
      data1 << time_mili(sign.created_at)
      data1 << sign.measures.find_by({ kindof: :ta }).value
      data2 << time_mili(sign.created_at)
      data2 << sign.measures.find_by({ kindof: :fc }).value
      data3 << time_mili(sign.created_at)
      data3 << sign.measures.find_by({ kindof: :fr }).value
      ta << data1
      fc << data2
      fr << data3
    end

    attr << ta
    attr << fc
    attr << fr
    attr
  end


  def time_mili date
    (date.to_f * 1000.0).to_i
  end
end
