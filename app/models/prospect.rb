class Prospect
  include Mongoid::Document
  include Mongoid::Timestamps

  field :code, type: String
  field :name, type: String
  field :lastname, type: String
  field :phone, type: String
  field :mobile, type: String
  field :mail, type: String
  field :contact_type, type: String
  field :other_state, type: String
  field :delegacion, type: String
  field :status, type: String, default: 'Activo'
  field :observation_contact, type: String
  field :observation, type: String
  field :relationship, type: String
	field :reason, type: String
  has_one :prospect_member
  has_many :tickets
  accepts_nested_attributes_for :prospect_member
  
  MEDIO = %W(Facebook
            e-mailing
            Google
            Vive+
            Internet
            Prog_TV
            Prog_Radio
            conferencia
            recomendaciòn 
            folleto/lugar
            manta
            Alianza
            otros)

  DELEGATION= %W(Benito_Juárez
                Coyoacán
                Miguel_Hidalgo
                Álvaro_Obregón
                Iztacalco
                Iztapalapa
                Gustavo_A_Madero
                Tlalpan
                Cuauhtémoc
                Magdalena_Contreras
                Azcapotzalco
                Venustiano_Carranza
                Otros)
  STATUS= %w(Busca_trabajo
              Contrata_residencia
              No_interés_real
              INDEP/Busca_talleres
              Fue_a_Club Mayores
              Fue_a_Residencia
              Fallecimiento
              Precio
              Salió_de_ciudad
              El_AM_rehusa_serv
              Desacuerdo_Fam
              Espionaje
              Datos_falsos)
    validates_presence_of :name, :lastname, :phone, :mobile, :mail
  
end
