require File.join(File.dirname(__FILE__), 'spec_helper')

describe Jnlp do
  before(:all) do
    @first_jnlp_path = File.join(File.dirname(__FILE__), 'fixtures', 'all-otrunk-snapshot-0.1.0-20091221.214313.jnlp')
    @gem_dir = File.expand_path(File.dirname(__FILE__))
    @first_jnlp = Jnlp::Jnlp.new(@first_jnlp_path)    
    @first_jar = @first_jnlp.jars.first
    @last_jar = @first_jnlp.jars[-1]
    @rhino_javascript_jar = @first_jnlp.jars.find { |jar| jar.name == 'js' }
    @first_nativelib = @first_jnlp.nativelibs.first
    @last_nativelib = @first_jnlp.nativelibs[-1]
  end

  it "should be named all-otrunk-snapshot-0.1.0-20091221.214313.jnlp" do
    @first_jnlp.name.should == 'all-otrunk-snapshot-0.1.0-20091221.214313.jnlp'
  end

  it "should have an offline_allowed attribute with the value true" do
    @first_jnlp.offline_allowed.should == true
  end

  it "should have a title of 'All OTrunk snapshot'" do
    @first_jnlp.title.should == 'All OTrunk snapshot'
  end

  it "should have an spec attribute with the value '1.0+'" do
    @first_jnlp.spec.should == '1.0+'
  end

  it "should have an argument attribute with the value 'dummy" do
    @first_jnlp.argument.should == 'dummy'
  end

  it "should have an codebase attribute with the value 'http://jnlp.concord.org/dev'" do
    @first_jnlp.codebase.should == 'http://jnlp.concord.org/dev'
  end

  it "should have an main_class attribute with the value 'net.sf.sail.emf.launch.EMFLauncher3'" do
    @first_jnlp.main_class.should == 'net.sf.sail.emf.launch.EMFLauncher3'
  end

  it "should have an initial_heap_size attribute with the value '32m'" do
    @first_jnlp.initial_heap_size.should == '32m'
  end

  it "should have an href attribute with the value 'http://jnlp.concord.org/dev/org/concord/maven-jnlp/all-otrunk-snapshot/all-otrunk-snapshot-0.1.0-20091221.214313.jnlp'" do
    @first_jnlp.href.should == 'http://jnlp.concord.org/dev/org/concord/maven-jnlp/all-otrunk-snapshot/all-otrunk-snapshot-0.1.0-20091221.214313.jnlp'
  end

  it "should have a url attribute with the value #{@first_jnlp_path}" do
    @first_jnlp.url.should == @first_jnlp_path
  end

  it "should have an max_heap_size attribute with the value '128m'" do
    @first_jnlp.max_heap_size.should == '128m'
  end

  it "should have a j2se_version attribute with the value '1.5+'" do
    @first_jnlp.j2se_version.should == '1.5+'
  end

  it "should have a j2se_version attribute with the value '1.5' if the os: mac_os_x is specified" do
    @first_jnlp.j2se_version('mac_os_x').should == '1.5'
  end

  it "should return nil in response to the j2se_version method if the os: mac_os_x and arch: x86_64 are specified" do
    @first_jnlp.j2se_version('mac_os_x', 'x86_64').should == nil
  end

  it "should have an vendor attribute with the value 'Concord Consortium'" do
    @first_jnlp.vendor.should == 'Concord Consortium'
  end

  it "should have an description attribute with the value 'Preview Basic Pas'" do
    @first_jnlp.description.should == 'Preview Basic Pas'
  end

  it "should have an local_jnlp_name attribute with the value 'local-all-otrunk-snapshot-0.1.0-20091221.214313.jnlp'" do
    @first_jnlp.local_jnlp_name.should == 'local-all-otrunk-snapshot-0.1.0-20091221.214313.jnlp'
  end

  it "should have an local_jnlp_href attribute" do
    @first_jnlp.local_jnlp_href == "#{@gem_dir}/spec/fixtures/#{@first_jnlp.local_jnlp_name}"
  end

  it "should have one property with the name: 'maven.jnlp.version' and the value 'all-otrunk-snapshot-0.1.0-20091221.214313.jnlp'" do
    @first_jnlp.properties.length.should == 1
    @first_jnlp.properties.first.name.should == 'maven.jnlp.version'
    @first_jnlp.properties.first.value.should == 'all-otrunk-snapshot-0.1.0-20091221.214313'
  end

  it "should have 67 jars" do
    @first_jnlp.jars.length == 67
  end

  # <jar href="org/concord/loader/loader.jar" version="0.1.0-20070419.035822-17"/>
  
  it "first jar should have the correct attributes" do
    @first_jar.filename_pack.should == 'sail-otrunk__V0.1.0-20091028.054139-1083.jar.pack'
    @first_jar.href.should == 'org/telscenter/sail-otrunk/sail-otrunk.jar'

    @first_jar.version.should == '0.1.0'
    @first_jar.revision.should == 1083
    @first_jar.certificate_version.should == ''
    @first_jar.date_str.should == '20091028.054139'
    @first_jar.date_time.should == DateTime.parse("2009-10-28T05:41:39Z")
    
    @first_jar.href_path.should == 'org/telscenter/sail-otrunk/'
    @first_jar.url.should == 'http://jnlp.concord.org/dev/org/telscenter/sail-otrunk/sail-otrunk.jar?version-id=0.1.0-20091028.054139-1083'
    @first_jar.url_pack_gz.should == 'http://jnlp.concord.org/dev/org/telscenter/sail-otrunk/sail-otrunk__V0.1.0-20091028.054139-1083.jar.pack.gz'

    @first_jar.kind.should == 'jar'

    @first_jar.name.should == 'sail-otrunk'
    @first_jar.os.should == nil
    @first_jar.suffix.should == '__V0.1.0-20091028.054139-1083.jar'
    @first_jar.filename.should == 'sail-otrunk__V0.1.0-20091028.054139-1083.jar'
    @first_jar.filename_pack_gz.should == 'sail-otrunk__V0.1.0-20091028.054139-1083.jar.pack.gz'
  end


  it "rhino javascript jar should have the correct version and revision attributes" do
    @rhino_javascript_jar.version.should == '1.5'
    @rhino_javascript_jar.revision.should == 4
  end

  it "should have 2 native libraries" do
    @first_jnlp.nativelibs.length == 2
  end

  it "first nativelib should have the correct attributes" do
    @first_nativelib.filename_pack.should == 'rxtx-serial-linux-nar__V2.1.7-r2.jar.pack'
    @first_nativelib.href.should == 'org/concord/external/rxtx/rxtx-serial/rxtx-serial-linux-nar.jar'

    @first_nativelib.version.should == '2.1.7'
    @first_nativelib.revision.should == 2
    @first_nativelib.certificate_version.should == ''
    @first_nativelib.date_str.should == ''
    @first_nativelib.date_time.should == nil
    
    @first_nativelib.href_path.should == 'org/concord/external/rxtx/rxtx-serial/'
    @first_nativelib.url.should == 'http://jnlp.concord.org/dev/org/concord/external/rxtx/rxtx-serial/rxtx-serial-linux-nar.jar?version-id=2.1.7-r2'
    @first_nativelib.url_pack_gz.should == 'http://jnlp.concord.org/dev/org/concord/external/rxtx/rxtx-serial/rxtx-serial-linux-nar__V2.1.7-r2.jar.pack.gz'

    @first_nativelib.kind.should == 'nativelib'

    @first_nativelib.name.should == 'rxtx-serial-linux-nar'
    @first_nativelib.os.should == 'linux'
    @first_nativelib.suffix.should == '__V2.1.7-r2.jar'
    @first_nativelib.filename.should == 'rxtx-serial-linux-nar__V2.1.7-r2.jar'
    @first_nativelib.filename_pack_gz.should == 'rxtx-serial-linux-nar__V2.1.7-r2.jar.pack.gz'

  end
end
