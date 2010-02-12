
# install JRuby and the jnlp gem (this should also install hpricot v 0.6.164)

require 'rubygems'
require 'java'
require 'jnlp'
require 'open-uri'
require 'nokogiri'

OTRUNK_EXAMPLES = '/Users/stephen/dev/concord/concord-projects-common.svn.git/java/otrunk/otrunk-examples'
@otml_classes = []
Dir["#{OTRUNK_EXAMPLES}/**/*.otml"].each do |f| 
  doc = Hpricot.XML(open(f))
  @otml_classes << doc.search("//import").collect {|i| i['class']}
end
@otml_classes.flatten!.uniq!

# get a jnlp and save the jars to a local dir called 'cache'
# if the cache is already filled this will be quick

jnlp = "http://jnlp.concord.org/dev/org/concord/maven-jnlp/all-otrunk-snapshot/all-otrunk-snapshot-0.1.0-20090410.183413.jnlp"
# jnlp = "http://jnlp.concord.org/dev/org/concord/maven-jnlp/all-otrunk-snapshot/all-otrunk-snapshot-0.1.0-20090327.222627.jnlp"
o = Jnlp::Otrunk.new(jnlp, 'cache')

# put all the jars on the classpath and made them available to JRuby:

o.require_resources

# define a method for looking at some of the otrunk classes and display some info

def ot_class_info1(otclass)
  begin
    java_import otclass
    name = otclass[/\.([^.]*$)/, 1]
    puts "fqdn: #{otclass}"
    puts "name: #{name}"
    puts
    ot_klazz = Kernel.const_get(name)
    ot_klazz.java_class.declared_instance_methods.each do |meth|
      puts "method name: #{meth.name}"
      puts "method arity: #{meth.arity}"
      return_type = meth.return_type
      if return_type
        puts "return_type: #{return_type}"
      else
        puts "return_type: void"
      end
      if meth.arity > 0
        parameter_types = meth.parameter_types
        if parameter_types
          puts "parameter_types: #{parameter_types.join(', ')}"
        end
      end
      puts
    end
  rescue NameError
    puts "#{otclass} not found"
  end
  puts
end

# define another method for looking at some of the otrunk classes and display some info  
import org.concord.otrunk.otcore.impl.ReflectiveOTClassFactory 
  
def ot_class_info2(otclass_str)  
  begin  
    otclass_ruby = eval(otclass_str) 
    otclass = ReflectiveOTClassFactory.singleton.registerClass(otclass_ruby.java_class); 
    ReflectiveOTClassFactory.singleton.processAllNewlyRegisteredClasses(); 
 
    name = otclass_ruby.java_class.simple_name 
    puts "fqdn: #{otclass_str}"  
    puts "name: #{name}"  
    puts  
    otclass.oTAllClassProperties.each do |prop| 
      puts "prop name: #{prop.name}" 
      type = prop.type 
      if type 
        puts "prop type: #{type.instanceClass.name}" 
      else 
        puts "prop type: void" 
      end 
    end 
  rescue NameError  
    puts "#{otclass_str} not found"  
  end  
  puts  
end


# puts "\n\ntotal unique ot classes: #{@otml_classes.length}\n\n"
# @otml_classes.each_with_index do |klazz, i| 
#   puts "\n-------------------- #{i} --------------------\n"
#   ot_class_info(klazz)
# end