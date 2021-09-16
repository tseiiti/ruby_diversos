# encoding: utf-8
system("cls")

# obriga e implementação do método na classe derivada
def interface
  caller =~ /`([^']*)'/ and $1
  method = caller[0].split(/`/)[1].delete("'")
  error = "#{self.class.name} needs to implement '#{method}' "
  error += "method for interface #{self.class.superclass}"
  raise NotImplementedError.new(error)
end

# impede a instaciação da classe
def abstract
  if self.class.name =~ /Abstract/
    error = "Abstract class #{self.class.name} "
    error += "can't instantiate an object"
    raise error
  end
end
