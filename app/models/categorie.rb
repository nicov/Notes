class Categorie < ActiveRecord::Base

  has_many :categories
  belongs_to :categorie
  has_many :notes
  has_and_belongs_to_many :new_notes,
    :class_name => "Note",
    :join_table => :categories_notes
#    :foreign_key => "note_id"

  # Methodes

  def path
    mere = self.categorie

    res = ""
    res << "#{mere.path}/" unless mere.nil?
    res << self.nom

    return res
  end

  def self.main
    self.where(:categorie_id => nil).order('nom ASC')
  end

  def select_map(level = 0)
    retrait = "-"*level
    res = [["#{retrait} #{self.nom}", self.id]]
    for c in self.categories.order("nom ASC")
      res.concat(c.select_map(level+1))
    end
    return res
  end

  def self.select_map(root = true)
    res = (root ? [["-", nil]] : [])
    main_categories = Categorie.where(:categorie_id => nil).order("nom ASC")
    for c in main_categories
      res.concat(c.select_map)
    end
    return res
  end

end
