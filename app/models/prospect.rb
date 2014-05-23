class Prospect
  include Mongoid::Document
  field :code, type: String
  field :name, type: String
  field :lastname, type: String
  field :phone, type: String
  field :mobile, type: String
  field :mail, type: String
  field :contact_type, type: String
  field :other_state, type: String
  field :delegacion, type: String
  field :status, type: String
  field :observation_contact, type: String
	field :observation, type: String
	field :relationship, type: String

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
end
