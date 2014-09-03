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
  field :status, type: Integer, default: 0
  field :observation_contact, type: String
  field :observation, type: String
  field :relationship, type: String
	field :reason, type: String
  has_one :prospect_member
  has_many :tickets
  accepts_nested_attributes_for :prospect_member
  validates_presence_of :name, :lastname, :phone, :mobile, :mail
 
   
  STATUS=[["Activo",0],["Cancelado",2],["Venta",1]] 
  scope :activo, -> {where(status: 0)}
  scope :cancelado, -> {where(status: 2)}
  scope :venta, -> {where(status:1)}

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
  REASON= %w( n/a
              Busca_trabajo
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
              Datos_falsos)
   
   
   
  def change_status(status)
    customer = nil
    case status.to_i
    when 0
      self.update_attributes!(status: 0)
    when 1
      customer = Customer.create!(name: self.name, lastname: self.lastname,phone: self.phone,mobile: self.mobile, mail: self.mail)
      customer.members << Member.new(name: self.prospect_member.name, lastname: self.prospect_member.lastname,gender: self.prospect_member.genre ,phone: self.prospect_member.phone )
      self.update_attributes!(status: 1) 
    when 2
      self.update_attributes!(status: 2)
    end
    customer
  end  
end
