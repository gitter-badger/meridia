class ProspectMember
  include Mongoid::Document
  include Mongoid::Timestamps   

  field :name, type: String
  field :lastname, type: String
  field :genre, type: Integer,default: 1
  field :age, type: String
  field :phone, type: String
  field :mobile, type: String
  field :cognitive, type: String
  field :physical, type: String
  field :transport, type: String
  field :days, type: String

    belongs_to :prospect
    has_many :pathologies
    PERSON_CONTACT = %W(la_persona_misma hijo hija hermano hermana nieto nieta sobrino
                                         sobrina esposo esposa amistad asistente vecino(a) Yerno Nuera)
    COGNITIVE = %W(Deterioro_Cognitivo
                                Demencia_Leve
                                Dem_Moderada
                                Dem_Avanzada
                                Sin_información
                                )
    PHYSICAL = %W(Con_ayuda 
                             Dependiente
                             Sin_información
                             )
  validates_presence_of :name, :lastname, :age, :phone
end
