jnlp

A gem for encapsulating the content and resources referenced by Java Web Start jnlps

Complete rdoc available here: http://rubywebstart.rubyforge.org/jnlp/rdoc/

For more information about the structure of Java Web Start see:

http://java.sun.com/javase/6/docs/technotes/guides/javaws/developersguide/contents.html

To create a new Jnlp call Jnlp#new with a string that contains either a local path or a url.

Examples:

Creating a new Jnlp object from a local Java Web Start jnlp file. 

  j = Jnlp::Jnlp.new("authoring.jnlp")

Creating a new Jnlp object from a Java Web Start jnlp referenced with a url. 

  j = Jnlp::Jnlp.new("jnlp.concord.org/dev/org/concord/maven-jnlp/otrunk-sensor/otrunk-sensor.jnlp")

Once the Jnlp object is created you can call Jnlp#cache_resources to create a local cache of all the jar and nativelib resources. 

The structure of the cache directory and the naming using for the jar and nativelib files is the same as that used by the Java Web Start Download Servlet, see:

  http://java.sun.com/javase/6/docs/technotes/guides/javaws/developersguide/downloadservletguide.html