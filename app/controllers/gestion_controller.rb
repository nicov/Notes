require 'rexml/document'

class GestionController < ApplicationController
  before_filter :authenticate_user!, :except => [:exporter]
  
  def exporter
    @notes = Note.all
    send_data @notes.to_xml(:skip_types => true),
    :type => 'text/xml; charset=UTF-8;',
    :disposition => "attachment; filename=notes_#{Time.zone.now.strftime("%Y-%m-%d_%H:%M")}.xml"
  end

  def importer
  end

  def upload
    # Recuperation du contenu xml
    xml_string = params[:file]['data'].read
    xml = REXML::Document.new(xml_string)

    xml.elements.each("notes/note") do |note|

      # Gestion de la categorie
      import_categorie = note.elements["categorie"].text
      categorie_path = import_categorie.split('/')

      # Tratement de la categorie racine
      nom = categorie_path.shift
      known_categorie = Categorie.where(:categorie_id => nil, :nom => nom).first
      known_categorie = Categorie.create(:nom => nom) if known_categorie.nil?
      
      # Traitement des sous categories
      for c in categorie_path
        id_pere = known_categorie.id
        known_categorie = Categorie.where(:categorie_id => id_pere, :nom => c).first
        known_categorie = Categorie.create(:nom => c, :categorie_id => id_pere) if known_categorie.nil?
      end

      # Gestion de la note
      Note.create(
        :titre => note.elements["titre"].text,
        :contenu => note.elements["contenu"].text,
        :categorie_id => known_categorie.id
      )
    end

    redirect_to root_path
  end

end
