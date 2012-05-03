module ApplicationHelper

  def jqtree
    Categorie.main.collect {|c| jqbranch(c)}
  end
  
  def jqbranch(categorie)
    children = categorie.categories.collect{|c| jqbranch(c) }
    {
      :label    => categorie_label(categorie),
      :id       => categorie.id,
      :children => children
    }
  end
  
  def categorie_label(categorie)
    link_to "#{categorie.nom} (#{categorie.notes.count})", categorie
  end
  
  def markdown(text)
    return nil if text.nil?
#    text = bash_line_filter(text)
    text = hr_filter(text)
    text = coderay(text)
    textilize(text).html_safe
  end
  
  def coderay(text)
    text.gsub(/```(.+?)\r\n(.+?)\r\n```(.*?)\r\n/m) do
      # header
      code = ""
      code << code_header($3) unless $3 == ""
      code << CodeRay.scan($2, $1).div(:css => :class)
      content_tag("notextile", code.html_safe)
    end
  end
  
  def code_header(text)
    content_tag("div", text, :class => 'code_header')
  end
  
  def hr_filter(text)
    text.gsub(/hr./) do
      "<hr/>"
    end
  end
  
  def bash_line_filter(text)
    text.gsub(/^([\$|>] .+?)$/) do
      str = "```bash\r\n"
      str << "#{$1}\r\n"
      str << "```\r\n"
    end
  end

end
