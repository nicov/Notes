class Note < ActiveRecord::Base

  # Associations
  belongs_to :categorie
  has_and_belongs_to_many :new_categories

  # Validations
  validates_presence_of :titre, :contenu

  # Methodes
  def to_xml(options)
    {
      :categorie => self.categorie.path,
      :titre => self.titre,
      :contenu => self.contenu
    }.to_xml(options)
  end
  
  def monter
    return if self.rang == 1
    rang = self.rang
    if rang.nil?
      derniere = Note.where(:categorie_id => self.categorie_id).order('rang DESC').limit(1).first
      self.rang = derniere.rang.to_i + 1
    else
      precedente = Note.where(:categorie_id => self.categorie_id, :rang => (self.rang - 1)).first
      if precedente.nil?
        self.rang -= 1
      else
        self.rang -= 1
        precedente.rang += 1
        precedente.save
      end 
    end
    
    save
  end
  
  def descendre
    derniere = Note.where(:categorie_id => self.categorie_id).order('rang DESC').limit(1).first
    return if derniere.id == self.id
    rang = self.rang
    if rang.nil?
      self.rang = derniere.rang.to_i + 1
    else
      suivante = Note.where(:categorie_id => self.categorie_id, :rang => (self.rang + 1)).first
      if suivante.nil?
        self.rang += 1
      else
        self.rang += 1
        suivante.rang -= 1
        suivante.save
      end
    end
    
    save
  end
  
end
